#!/bin/bash

# Deploy both Query and Compliance plugins to localhost XNAT docker
# Run this from xnat_docker_testing directory

set -e

QUERY_PLUGIN="/Users/james/projects/xnat_query_plugin/build/libs/xnat_query_plugin-1.0.0.jar"
COMPLIANCE_PLUGIN="/Users/james/projects/xnat_compliance_plugin/build/libs/xnat_compliance_plugin-0.1.0.jar"
PLUGINS_DIR="./xnat/plugins"

echo "========================================="
echo "  XNAT Compliance Dashboard Deployment"
echo "========================================="
echo ""

# Check if we're in the right directory
if [ ! -f "docker-compose.yml" ]; then
    echo "❌ Error: Must run from xnat_docker_testing directory"
    echo "   cd /Users/james/projects/xnat_docker_testing"
    exit 1
fi

# Check if plugins exist
if [ ! -f "$QUERY_PLUGIN" ]; then
    echo "❌ Query plugin not found: $QUERY_PLUGIN"
    echo "   Build it first: cd ../xnat_query_plugin && ./gradlew clean build"
    exit 1
fi

if [ ! -f "$COMPLIANCE_PLUGIN" ]; then
    echo "❌ Compliance plugin not found: $COMPLIANCE_PLUGIN"
    echo "   Build it first: cd ../xnat_compliance_plugin && ./gradlew clean build"
    exit 1
fi

# Create plugins directory if it doesn't exist
mkdir -p "$PLUGINS_DIR"

# Remove old versions
echo "🗑️  Removing old plugin versions..."
rm -f "$PLUGINS_DIR"/xnat_query_plugin*.jar
rm -f "$PLUGINS_DIR"/xnat_compliance_plugin*.jar

# Copy new plugins
echo "📦 Deploying Query Plugin..."
cp "$QUERY_PLUGIN" "$PLUGINS_DIR/"
echo "   ✅ xnat_query_plugin-1.0.0.jar (4.6 MB)"

echo "📦 Deploying Compliance Plugin..."
cp "$COMPLIANCE_PLUGIN" "$PLUGINS_DIR/"
echo "   ✅ xnat_compliance_plugin-0.1.0.jar (22 KB)"

echo ""
echo "🔄 Restarting XNAT..."

# Check if containers are running
if docker-compose ps xnat-web | grep -q "Up"; then
    docker-compose restart xnat-web
    echo "   ⏳ Waiting for XNAT to restart (30 seconds)..."
    sleep 30
else
    echo "   ⚠️  XNAT container not running. Starting now..."
    docker-compose up -d
    echo "   ⏳ Waiting for XNAT to start (60 seconds)..."
    sleep 60
fi

echo ""
echo "========================================="
echo "  ✅ Deployment Complete!"
echo "========================================="
echo ""
echo "Installed plugins:"
ls -lh "$PLUGINS_DIR"/*.jar
echo ""
echo "🔍 Verification Commands:"
echo ""
echo "  # Check XNAT is running:"
echo "  curl -I http://localhost/"
echo ""
echo "  # Check query plugin:"
echo "  curl http://localhost/xapi/query/admin/statistics"
echo ""
echo "  # Check compliance plugin:"
echo "  curl http://localhost/xapi/compliance/metrics"
echo ""
echo "  # View logs:"
echo "  docker-compose logs -f xnat-web"
echo ""
echo "🌐 Access XNAT:"
echo "  • Main page: http://localhost/"
echo "  • Query Management: http://localhost/app/template/Page.vm?view=query-management"
echo "  • Compliance Dashboard: (via query management page)"
echo ""
