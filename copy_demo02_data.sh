#!/bin/bash
# Script to copy DICOM data from demo02 to localhost for testing

set -e

echo "=== Copying Prostate-AEC-115 from demo02 to localhost ==="
echo ""

echo "Step 1: Creating tar archive on demo02 (will prompt for sudo password)..."
ssh -t demo02 'cd /data/xnat/archive/Prostate-AEC/arc001/ && sudo tar czf /tmp/Prostate-AEC-115.tar.gz Prostate-AEC-115 && sudo chown james:james /tmp/Prostate-AEC-115.tar.gz && ls -lh /tmp/Prostate-AEC-115.tar.gz'

echo ""
echo "Step 2: Copying archive from demo02 to localhost..."
scp demo02:/tmp/Prostate-AEC-115.tar.gz /tmp/
echo "Copied to /tmp/Prostate-AEC-115.tar.gz"

echo ""
echo "Step 3: Creating archive directory structure..."
mkdir -p /Users/james/projects/xnat_docker_testing/xnat-data/archive/Prostate-AEC/arc001

echo ""
echo "Step 4: Extracting archive..."
cd /Users/james/projects/xnat_docker_testing/xnat-data/archive/Prostate-AEC/arc001
tar xzf /tmp/Prostate-AEC-115.tar.gz
echo "Extracted to $(pwd)/Prostate-AEC-115"

echo ""
echo "Step 5: Setting ownership (XNAT container uses uid 1000) - will prompt for local sudo password..."
sudo chown -R 1000:1000 Prostate-AEC-115

echo ""
echo "Step 6: Restarting XNAT container..."
cd /Users/james/projects/xnat_docker_testing
docker-compose restart xnat-web

echo ""
echo "=== Copy complete! ==="
echo "Waiting 60 seconds for XNAT to restart..."
sleep 60

echo ""
echo "Testing endpoint..."
curl -s "http://localhost/xapi/dicomweb/projects/Prostate-AEC/studies/1.3.6.1.4.1.14519.5.2.1.192342080646731188113889763362087290669/metadata" -u admin:admin | jq 'if type == "array" then "SUCCESS: Found \(length) instances" else "Response type: \(type)" end' 2>&1

echo ""
echo "Done!"
