#!/bin/bash
# Fix the extracted data permissions and verify DICOM files

cd /Users/james/projects/xnat_docker_testing/xnat-data/archive/Prostate-AEC/arc001

echo "Removing old extraction..."
sudo rm -rf Prostate-AEC-115

echo "Re-extracting archive..."
tar xzf /tmp/Prostate-AEC-115.tar.gz

echo "Setting ownership to uid 1000 (XNAT container)..."
sudo chown -R 1000:1000 Prostate-AEC-115

echo ""
echo "Checking DICOM files..."
DICOM_COUNT=$(find Prostate-AEC-115 -name "*.dcm" 2>/dev/null | wc -l)
echo "Found $DICOM_COUNT DICOM files"

echo ""
echo "Restarting XNAT..."
cd /Users/james/projects/xnat_docker_testing
docker-compose restart xnat-web

echo "Waiting 60 seconds for XNAT to start..."
sleep 60

echo ""
echo "Testing study metadata endpoint..."
curl -s "http://localhost/xapi/dicomweb/projects/Prostate-AEC/studies/1.3.6.1.4.1.14519.5.2.1.192342080646731188113889763362087290669/metadata" -u admin:admin | jq 'if type == "array" then "SUCCESS: Found \(length) instances" elif . == "" or . == null then "EMPTY RESPONSE" else "Got: \(type)" end' 2>&1

echo ""
echo "Done!"
