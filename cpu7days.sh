#!/bin/bash
top -b -n 1 -d 3 -o +%CPU | sed -e '1,/PID/d' | head -4 | ts '[%Y-%m-%d %H:%M:%S]' >> /usr/local/bin/cpu_usage.log

#This will output the top 4 processor memory hogs and append them to the cpu_usage log
#You must create cpu_usage.log in /usr/local/bin.  And you must add this to crontab by invoking sudo crontab -e.  It will not run properly otherwise
