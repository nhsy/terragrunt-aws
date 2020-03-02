#!/bin/bash

set -euxo pipefail

# output to log files
exec >> /var/log/userdata.log 2>&1
echo userdata_start

yum update -y

echo userdata_complete
