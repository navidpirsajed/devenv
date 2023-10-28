#!/bin/bash
echo "Container started"

# start open ssh server
service ssh start

# keep container running
tail -f /dev/null