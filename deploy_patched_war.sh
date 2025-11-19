#!/bin/bash
# Deploy patched xnat-web WAR using mounted webapp directory

set -e

PATCHED_WAR="/Users/james/projects/xnat-web/build/libs/xnat-web-1.9.2.1.war"
WEBAPP_DIR="./xnat/webapp"

echo "========================================="
echo "  Deploy Patched XNAT WAR"
echo "  (with multipart/related fix)"
echo "========================================="
echo

# Check if WAR exists
if [ ! -f "$PATCHED_WAR" ]; then
    echo "❌ Patched WAR not found: $PATCHED_WAR"
    echo "   Build it first: cd ../xnat-web && ./gradlew war"
    exit 1
fi

WAR_SIZE=$(ls -lh "$PATCHED_WAR" | awk '{print $5}')
echo "📦 Patched WAR: $PATCHED_WAR ($WAR_SIZE)"
echo

# Stop container
echo "🛑 Stopping xnat-web container..."
docker-compose stop xnat-web

# Backup existing webapp if it exists
if [ -d "$WEBAPP_DIR" ]; then
    echo "💾 Backing up existing webapp..."
    BACKUP_NAME="webapp-backup-$(date +%Y%m%d_%H%M%S).tar.gz"
    tar czf "$BACKUP_NAME" "$WEBAPP_DIR"
    echo "   Backup saved: $BACKUP_NAME"
fi

# Remove old webapp directory
echo "🗑️  Removing old webapp..."
rm -rf "$WEBAPP_DIR"

# Create new webapp directory
echo "📂 Creating webapp directory..."
mkdir -p "$WEBAPP_DIR"

# Extract patched WAR
echo "📤 Extracting patched WAR to $WEBAPP_DIR..."
cd "$WEBAPP_DIR"
unzip -q "$PATCHED_WAR"
cd ../..

echo "   ✅ WAR extracted successfully"
echo

# Start container
echo "🚀 Starting xnat-web container..."
docker-compose up -d xnat-web

echo
echo "⏳ Waiting for XNAT to start (60 seconds)..."
sleep 60

echo
echo "========================================="
echo "  ✅ Patched XNAT Deployed!"
echo "========================================="
echo
echo "Webapp location: $(pwd)/$WEBAPP_DIR"
echo
echo "🔍 Verification:"
echo "  # Check XNAT is running:"
echo "  curl -I http://localhost/"
echo
echo "  # Check logs for multipart fix:"
echo "  docker logs xnat-web 2>&1 | grep -i 'DicomWebConfig.*MultipartRelated'"
echo
echo "  # Test STOW-RS:"
echo "  cd /Users/james/projects/xnat_dicomweb_plugin"
echo "  ./test_stow_rs.sh http://localhost DICOMWEB_TEST admin admin"
echo
