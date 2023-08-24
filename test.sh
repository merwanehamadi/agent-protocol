#!/bin/bash

# Check if a URL was provided as the first argument
if [ -z "$1" ]; then
  echo "Usage: $0 <url>"
  echo "Please provide the URL as the first argument."
  exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
  echo "npm is not found. Please install Node.js and npm, then run this script again."
  exit 1
else
  echo "npm is already installed"
fi

# Use the provided URL as the value for the env-var
URL="$1"

npm install -g newman

newman run https://raw.githubusercontent.com/Significant-Gravitas/postman/master/Postman%20Collections/agent_protocol_v0.4.json \
-e https://raw.githubusercontent.com/Significant-Gravitas/postman/master/Postman%20Collections/env_0.4.json \
--env-var "url=$URL" \
-r htmlextra \
--reporter-htmlextra-export report.html
