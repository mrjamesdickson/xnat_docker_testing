#!/bin/bash

# Deploy DICOMweb plugin to localhost XNAT docker
# Run this from xnat_docker_testing directory

set -e

DICOMWEB_PLUGIN="/Users/james/projects/xnat_dicomweb_plugin/build/libs/xnat-dicomweb-proxy-1.1.3.jar"
PLUGINS_DIR="./xnat/plugins"

echo "========================================="
echo "  XNAT DICOMweb Plugin Deployment"
echo "========================================="
echo ""

# Check if we're in the right directory
if [ ! -f "docker-compose.yml" ]; then
    echo "❌ Error: Must run from xnat_docker_testing directory"
    echo "   cd /Users/james/projects/xnat_docker_testing"
    exit 1
fi

# Check if plugin exists
if [ ! -f "$DICOMWEB_PLUGIN" ]; then
    echo "❌ DICOMweb plugin not found: $DICOMWEB_PLUGIN"
    echo "   Build it first: cd ../xnat_dicomweb_plugin && ./gradlew jar"
    exit 1
fi

# Create plugins directory if it doesn't exist
mkdir -p "$PLUGINS_DIR"

# Remove old versions
echo "🗑️  Removing old DICOMweb plugin versions..."
rm -f "$PLUGINS_DIR"/xnat-dicomweb-proxy*.jar

# Copy new plugin
echo "📦 Deploying DICOMweb Plugin..."
cp "$DICOMWEB_PLUGIN" "$PLUGINS_DIR/"
PLUGIN_SIZE=$(ls -lh "$DICOMWEB_PLUGIN" | awk '{print $5}')
echo "   ✅ xnat-dicomweb-proxy-1.1.3.jar ($PLUGIN_SIZE)"

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
echo "Installed plugin:"
ls -lh "$PLUGINS_DIR"/xnat-dicomweb-proxy*.jar
echo ""
echo "🔍 Verification Commands:"
echo ""
echo "  # Check XNAT is running:"
echo "  curl -I http://localhost/"
echo ""
echo "  # Check DICOMweb plugin loaded:"
echo "  docker logs xnat-web 2>&1 | grep -i dicomweb"
echo ""
echo "  # Check spring.log for errors:"
echo "  docker exec xnat-web tail -100 /data/xnat/home/logs/spring.log"
echo ""
echo "  # Test QIDO-RS (requires project and data):"
echo "  curl -u admin:admin http://localhost/xapi/dicomweb/projects/YOUR_PROJECT/studies"
echo ""
echo "  # Test STOW-RS upload:"
echo "  cd /Users/james/projects/xnat_dicomweb_plugin"
echo "  ./test_stow_rs.sh http://localhost YOUR_PROJECT admin admin"
echo ""
echo "  # View logs:"
echo "  docker-compose logs -f xnat-web"
echo ""
echo "🌐 Access XNAT:"
echo "  • Main page: http://localhost/"
echo "  • Swagger UI: http://localhost/swagger-ui.html"
echo "  • Test page: http://localhost/xapi/dicomweb/test"
echo ""
