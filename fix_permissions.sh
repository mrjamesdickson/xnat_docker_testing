#!/bin/bash
# Fix permissions so XNAT container can read the data

cd /Users/james/projects/xnat_docker_testing/xnat-data/archive/Prostate-AEC/arc001

echo "Setting ownership and permissions..."
sudo chown -R 1000:1000 Prostate-AEC-115
sudo chmod -R 755 Prostate-AEC-115

echo ""
echo "Verifying from host:"
find Prostate-AEC-115 -name "*.dcm" 2>/dev/null | wc -l

echo ""
echo "Restarting XNAT container..."
cd /Users/james/projects/xnat_docker_testing
docker-compose restart xnat-web

sleep 60

echo ""
echo "Verifying from container:"
docker exec xnat-web find /data/xnat/archive/Prostate-AEC/arc001/Prostate-AEC-115 -name "*.dcm" 2>/dev/null | wc -l

echo ""
echo "Testing endpoint..."
curl -s "http://localhost/xapi/dicomweb/projects/Prostate-AEC/studies/1.3.6.1.4.1.14519.5.2.1.192342080646731188113889763362087290669/metadata" -u admin:admin | jq 'if type == "array" then "SUCCESS: \(length) instances" else . end' 2>&1
