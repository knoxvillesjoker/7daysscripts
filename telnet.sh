#!/bin/bash

expect /usr/local/bin/telnetlog.sh | tee -a /usr/local/bin/telnet.log
# add to crontab with sudo crontab -e and adding:
# @hourly /usr/local/bin/telnet.sh
