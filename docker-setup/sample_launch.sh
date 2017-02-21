#!/bin/sh

UUID=$(uuidgen)
echo "Sending sample job with uuid ${UUID}"
curl -u vagrant:password -H "content-type: application/json" -XPOST http://localhost:12321/rawscheduler -d '{"jobs": [{"max_retries": 3, "max_runtime": 86400000, "mem": 1000, "cpus": 1.5, "uuid": "'"${UUID}"'", "command": "echo hello my friend", "priority": 0, "name": "echotest"}]}'
