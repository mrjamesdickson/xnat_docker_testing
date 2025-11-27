#!/bin/bash
#
# Switch between simple PostgreSQL and Patroni HA mode
#
# Usage:
#   ./scripts/switch-db-mode.sh simple    # Single PostgreSQL (default)
#   ./scripts/switch-db-mode.sh patroni   # Patroni HA cluster
#   ./scripts/switch-db-mode.sh status    # Show current mode
#
# For demos: This allows switching between simple and HA mode
# with the same XNAT data (archive, plugins, etc.)
#
# Data locations:
#   Simple mode:  ./postgres-data
#   Patroni mode: ./patroni-data/primary, ./patroni-data/replica
#
# Note: Database data is NOT shared between modes - you'll need to
# migrate data if switching with existing data.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_DIR"

show_status() {
    echo "=== XNAT Database Mode Status ==="
    echo ""

    if [ -f ".env.active" ]; then
        if grep -q "patroni-haproxy" .env; then
            echo "Current mode: PATRONI HA"
            echo "Database URL: jdbc:postgresql://patroni-haproxy:5432/xnat"
        else
            echo "Current mode: SIMPLE (single PostgreSQL)"
            echo "Database URL: jdbc:postgresql://xnat-db/xnat"
        fi
    else
        echo "Current mode: SIMPLE (single PostgreSQL) [default]"
    fi

    echo ""
    echo "Running containers:"
    docker-compose ps --format "table {{.Name}}\t{{.Status}}" 2>/dev/null | grep -E "xnat-db|patroni" || echo "  (none running)"
    echo ""
}

start_simple() {
    echo "=== Starting SIMPLE mode (single PostgreSQL) ==="

    # Stop any running services
    echo "Stopping existing services..."
    docker-compose -f docker-compose.yml -f docker-compose.patroni.yml down 2>/dev/null || true
    docker-compose down 2>/dev/null || true

    # Use default .env
    if [ -f ".env.backup" ]; then
        cp .env.backup .env
    fi

    # Start with simple compose
    echo "Starting services with simple PostgreSQL..."
    docker-compose up -d

    echo ""
    echo "=== SIMPLE mode started ==="
    echo "Database: xnat-db (single PostgreSQL)"
    echo "XNAT URL: http://localhost:${XNAT_HOST_PORT:-80}"
    echo ""
}

start_patroni() {
    echo "=== Starting PATRONI HA mode ==="

    # Stop any running services
    echo "Stopping existing services..."
    docker-compose -f docker-compose.yml -f docker-compose.patroni.yml down 2>/dev/null || true
    docker-compose down 2>/dev/null || true

    # Backup original .env if not already done
    if [ ! -f ".env.backup" ]; then
        cp .env .env.backup
    fi

    # Use Patroni .env
    cp .env.patroni .env

    # Create patroni data directories
    mkdir -p patroni-data/etcd patroni-data/primary patroni-data/replica

    # Start with Patroni compose
    echo "Starting services with Patroni HA..."
    docker-compose -f docker-compose.yml -f docker-compose.patroni.yml up -d

    echo ""
    echo "=== PATRONI HA mode started ==="
    echo "Database: patroni-haproxy:5432 (HA cluster)"
    echo "  - Primary:  patroni-primary"
    echo "  - Replica:  patroni-replica"
    echo "  - etcd:     patroni-etcd"
    echo ""
    echo "HAProxy stats: http://localhost:7000"
    echo "XNAT URL:      http://localhost:${XNAT_HOST_PORT:-80}"
    echo ""
    echo "Wait ~30 seconds for Patroni cluster to initialize..."
    echo ""
}

migrate_to_patroni() {
    echo "=== Migrating data from simple to Patroni ==="
    echo ""
    echo "This will:"
    echo "1. Stop all services"
    echo "2. Dump data from simple PostgreSQL"
    echo "3. Start Patroni cluster"
    echo "4. Restore data to Patroni"
    echo ""
    read -p "Continue? [y/N] " confirm
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 0
    fi

    # Stop services
    docker-compose down 2>/dev/null || true

    # Start simple postgres temporarily for dump
    docker-compose up -d xnat-db
    sleep 5

    # Dump the database
    echo "Dumping database..."
    docker exec xnat-db pg_dump -U xnat -d xnat > /tmp/xnat_dump.sql

    # Stop simple postgres
    docker-compose down

    # Start Patroni
    start_patroni

    # Wait for cluster to be ready
    echo "Waiting for Patroni cluster to initialize..."
    sleep 30

    # Restore to Patroni
    echo "Restoring database to Patroni..."
    docker exec -i patroni-primary psql -U xnat -d xnat < /tmp/xnat_dump.sql

    echo ""
    echo "=== Migration complete ==="
    rm -f /tmp/xnat_dump.sql
}

demo_failover() {
    echo "=== Demo: Patroni Failover ==="
    echo ""

    if ! docker ps | grep -q patroni-primary; then
        echo "Error: Patroni is not running. Start with: $0 patroni"
        exit 1
    fi

    echo "Current cluster status:"
    docker exec patroni-primary patronictl list 2>/dev/null || echo "(waiting for cluster...)"
    echo ""

    echo "Simulating primary failure by stopping patroni-primary..."
    docker stop patroni-primary

    echo ""
    echo "Waiting 15 seconds for failover..."
    sleep 15

    echo ""
    echo "Cluster status after failover:"
    docker exec patroni-replica patronictl list 2>/dev/null || echo "(checking...)"

    echo ""
    echo "Restarting original primary as replica..."
    docker start patroni-primary
    sleep 10

    echo ""
    echo "Final cluster status:"
    docker exec patroni-replica patronictl list 2>/dev/null || docker exec patroni-primary patronictl list 2>/dev/null
    echo ""
}

case "${1:-status}" in
    simple)
        start_simple
        ;;
    patroni|ha)
        start_patroni
        ;;
    status)
        show_status
        ;;
    migrate)
        migrate_to_patroni
        ;;
    failover|demo)
        demo_failover
        ;;
    *)
        echo "Usage: $0 {simple|patroni|status|migrate|failover}"
        echo ""
        echo "Commands:"
        echo "  simple    - Start with single PostgreSQL (default)"
        echo "  patroni   - Start with Patroni HA cluster"
        echo "  status    - Show current database mode"
        echo "  migrate   - Migrate data from simple to Patroni"
        echo "  failover  - Demo: simulate primary failure and failover"
        echo ""
        exit 1
        ;;
esac
