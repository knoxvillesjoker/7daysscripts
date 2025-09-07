#!/bin/bash
cat /dev/null > /usr/local/bin/cpu_usage.log
cat /dev/null > /usr/local/bin/telnet.log

# This clears the cpu_usage.log
# Run this once weekly with this line in crontab
# @weekly /usr/local/bin/cleanlog.sh
