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

echo "🔄 Restarting XNAT..."
echo ""

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
