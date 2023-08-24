#!/bin/bash

npm install -g newman

newman run https://raw.githubusercontent.com/Significant-Gravitas/postman/master/Postman%20Collections/agent_protocol_v0.4.json \
-e https://raw.githubusercontent.com/Significant-Gravitas/postman/master/Postman%20Collections/env_0.4.json \
--env-var "url=http://127.0.0.1:8000" \
-r htmlextra \
--reporter-htmlextra-export report.html
