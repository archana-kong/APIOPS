#!/bin/bash

# Set the endpoint URL
ENDPOINT="http://10.68.87.27:8000/flights"  
API_KEY="jdoe-key"

# Initialize counters for successes and failures
success_count=0
failure_count=0

# Loop to send 10 HTTP requests
for i in {1..10}; do
  echo "Sending request #$i..."

  # Send HTTP GET request and capture the HTTP status code
  STATUS=$(curl -o /dev/null -s -w "%{http_code}" -H "apikey:$API_KEY" "$ENDPOINT")

  # Check if the status code is 200
  if [ "$STATUS" -eq 200 ]; then
    echo "Request #$i: Success (200 OK)"
    ((success_count++))
  else
    echo "Request #$i: Failed (HTTP Status: $STATUS)"
    ((failure_count++))
    exit 1
  fi
done
