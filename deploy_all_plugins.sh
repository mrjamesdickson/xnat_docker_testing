#!/bin/bash

# Deploy all XNAT plugins from ~/projects/xnat_*_plugin directories
# Finds all xnat_*_plugin projects and deploys their JARs if they exist

set -e

PLUGINS_DIR="./xnat/plugins"
PROJECTS_DIR="/Users/james/projects"

echo "========================================="
echo "  XNAT All Plugins Deployment"
echo "========================================="
echo ""

# Check if we're in the right directory
if [ ! -f "docker-compose.yml" ]; then
    echo "❌ Error: Must run from xnat_docker_testing directory"
    echo "   cd /Users/james/projects/xnat_docker_testing"
    exit 1
fi

# Create plugins directory if it doesn't exist
mkdir -p "$PLUGINS_DIR"

# Find all xnat_*_plugin directories
PLUGIN_PROJECTS=$(find "$PROJECTS_DIR" -maxdepth 1 -type d -name "xnat_*_plugin" | sort)

if [ -z "$PLUGIN_PROJECTS" ]; then
    echo "⚠️  No xnat_*_plugin projects found in $PROJECTS_DIR"
    exit 0
fi

echo "🔍 Scanning for XNAT plugins..."
echo ""

DEPLOYED_COUNT=0
SKIPPED_COUNT=0

for PROJECT_DIR in $PLUGIN_PROJECTS; do
    PROJECT_NAME=$(basename "$PROJECT_DIR")
    JAR_DIR="$PROJECT_DIR/build/libs"

    # Look for JAR files in build/libs
    if [ -d "$JAR_DIR" ]; then
        # Find the main plugin JAR (not shadowJar or other variants)
        PLUGIN_JAR=$(find "$JAR_DIR" -name "${PROJECT_NAME}*.jar" -type f | grep -v "sources\|javadoc\|plain" | head -1)

        if [ -n "$PLUGIN_JAR" ] && [ -f "$PLUGIN_JAR" ]; then
            JAR_NAME=$(basename "$PLUGIN_JAR")
            JAR_SIZE=$(ls -lh "$PLUGIN_JAR" | awk '{print $5}')

            echo "📦 Deploying: $PROJECT_NAME"
            echo "   Source: $JAR_NAME ($JAR_SIZE)"

            # Remove old versions of this plugin
            rm -f "$PLUGINS_DIR/${PROJECT_NAME}"*.jar

            # Copy new version
            cp "$PLUGIN_JAR" "$PLUGINS_DIR/"
            echo "   ✅ Deployed"
            echo ""

            ((DEPLOYED_COUNT++))
        else
            echo "⏭️  Skipped: $PROJECT_NAME (no JAR found in build/libs)"
            echo "   Run: cd $PROJECT_DIR && ./gradlew clean build"
            echo ""
            ((SKIPPED_COUNT++))
        fi
    else
        echo "⏭️  Skipped: $PROJECT_NAME (no build directory)"
        echo ""
        ((SKIPPED_COUNT++))
    fi
done

echo "========================================="
echo "  Deployment Summary"
echo "========================================="
echo "  ✅ Deployed: $DEPLOYED_COUNT plugins"
echo "  ⏭️  Skipped:  $SKIPPED_COUNT plugins"
echo ""

if [ $DEPLOYED_COUNT -eq 0 ]; then
    echo "⚠️  No plugins were deployed"
    echo "   Build plugins first: cd <plugin_dir> && ./gradlew clean build"
    exit 0
fi

echo "🗂️  Installed plugins in $PLUGINS_DIR:"
ls -lh "$PLUGINS_DIR"/xnat_*.jar 2>/dev/null || echo "   (none)"
echo ""

echo "🔄 Restarting XNAT cluster..."
echo ""

# Get list of all web containers (xnat-web, xnat-web-2, etc.)
WEB_CONTAINERS=$(docker-compose ps --services 2>/dev/null | grep "^xnat-web" | tr '\n' ' ')

if [ -z "$WEB_CONTAINERS" ]; then
    WEB_CONTAINERS="xnat-web"
fi

echo "   📋 Web containers to restart: $WEB_CONTAINERS"
echo ""

# Check if containers are running
if docker-compose ps xnat-web 2>/dev/null | grep -q "Up"; then
    # Restart ALL web containers (required for shared webapp/plugins volume)
    docker-compose restart $WEB_CONTAINERS
else
    echo "   ⚠️  XNAT container not running. Starting now..."
    docker-compose up -d
fi

# Wait for primary node to be healthy with progress indicator
echo ""
echo "   ⏳ Waiting for XNAT cluster to start..."
MAX_WAIT=300  # 5 minutes max
WAIT_INTERVAL=10
ELAPSED=0

while [ $ELAPSED -lt $MAX_WAIT ]; do
    # Check primary node health via internal curl
    STATUS=$(docker exec xnat-web curl -s -o /dev/null -w '%{http_code}' --max-time 5 http://localhost:8080/ 2>/dev/null || echo "000")

    if [ "$STATUS" = "302" ]; then
        echo ""
        echo "   ✅ Primary node (xnat-web) is ready after ${ELAPSED}s"
        break
    fi

    # Show progress
    printf "   ⏳ Waiting... %ds (status: %s)\r" "$ELAPSED" "$STATUS"
    sleep $WAIT_INTERVAL
    ELAPSED=$((ELAPSED + WAIT_INTERVAL))
done

if [ $ELAPSED -ge $MAX_WAIT ]; then
    echo ""
    echo "   ⚠️  Timeout waiting for primary node. Continuing anyway..."
fi

# Give other nodes a bit more time
echo "   ⏳ Waiting 30s for remaining nodes..."
sleep 30

# Restart nginx to refresh DNS (container IPs may have changed)
echo ""
echo "🔄 Restarting nginx to refresh DNS..."
docker-compose restart xnat-nginx
sleep 5

# Verify all nodes are healthy with retry logic
echo ""
echo "🔍 Verifying cluster health..."
ALL_HEALTHY=false
RETRY_COUNT=0
MAX_RETRIES=6  # 6 retries x 10s = 60s additional wait

while [ "$ALL_HEALTHY" = "false" ] && [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
    ALL_HEALTHY=true

    for container in $WEB_CONTAINERS; do
        STATUS=$(docker exec xnat-nginx curl -s -o /dev/null -w '%{http_code}' --max-time 5 http://$container:8080/ 2>/dev/null || echo "error")
        if [ "$STATUS" = "302" ]; then
            echo "   ✅ $container: OK"
        else
            echo "   ⏳ $container: $STATUS (still starting)"
            ALL_HEALTHY=false
        fi
    done

    if [ "$ALL_HEALTHY" = "false" ]; then
        RETRY_COUNT=$((RETRY_COUNT + 1))
        if [ $RETRY_COUNT -lt $MAX_RETRIES ]; then
            echo ""
            echo "   ⏳ Some nodes still starting, waiting 10s... (attempt $RETRY_COUNT/$MAX_RETRIES)"
            sleep 10
            echo ""
        fi
    fi
done

if [ "$ALL_HEALTHY" = "false" ]; then
    echo ""
    echo "   ⚠️  Some nodes may still be starting. Check manually with:"
    echo "   docker logs xnat-web-X 2>&1 | tail -20"
fi

echo ""
echo "========================================="
echo "  ✅ Deployment Complete!"
echo "========================================="
echo ""
echo "🔍 Verification Commands:"
echo ""
echo "  # Check XNAT is running:"
echo "  curl -I http://localhost/"
echo ""
echo "  # Check plugin status:"
echo "  curl http://localhost/xapi/plugins"
echo ""
echo "  # View logs:"
echo "  docker-compose logs -f xnat-web | grep -i plugin"
echo ""
echo "🌐 Access XNAT:"
echo "  http://localhost/"
echo ""
