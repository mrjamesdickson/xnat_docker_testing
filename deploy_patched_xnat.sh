#!/bin/bash
# Deploy patched xnat-web WAR to localhost Docker XNAT

set -e

PATCHED_WAR="/Users/james/projects/xnat-web/build/libs/xnat-web-1.9.2.1.war"
CONTAINER="xnat-web"

echo "========================================="
echo "  Deploy Patched XNAT Web (with multipart/related fix)"
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

# Make sure container is running
echo "🔄 Ensuring container is running..."
docker-compose up -d xnat-web
sleep 5

# Copy patched WAR to container
echo "📤 Copying patched WAR to container..."
docker cp "$PATCHED_WAR" xnat-web:/tmp/xnat-web-patched.war

# Backup, remove old webapp, and extract new one
echo "💾 Backing up and replacing webapp..."
docker exec xnat-web sh -c "
    # Backup current webapp
    cd /usr/local/tomcat/webapps &&
    tar czf /tmp/ROOT-backup-\$(date +%Y%m%d_%H%M%S).tar.gz ROOT 2>/dev/null || true &&

    # Remove old webapp
    rm -rf ROOT &&

    # Extract new webapp
    mkdir -p ROOT &&
    cd ROOT &&
    unzip -q /tmp/xnat-web-patched.war &&
    rm /tmp/xnat-web-patched.war &&

    echo 'Webapp replaced successfully'
"

# Restart container to apply changes
echo "🔄 Restarting XNAT container..."
docker-compose restart xnat-web

echo
echo "⏳ Waiting for XNAT to start (60 seconds)..."
sleep 60

echo
echo "========================================="
echo "  ✅ Patched XNAT Deployed!"
echo "========================================="
echo
echo "🔍 Verification:"
echo "  # Check XNAT is running:"
echo "  curl -I http://localhost/"
echo
echo "  # Check for multipart/related fix in logs:"
echo "  docker logs xnat-web 2>&1 | grep -i 'multipart.*related'"
echo
echo "  # Test STOW-RS:"
echo "  cd /Users/james/projects/xnat_dicomweb_plugin"
echo "  ./test_stow_rs.sh http://localhost DICOMWEB_TEST admin admin"
echo
