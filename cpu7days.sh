#!/bin/bash
top -b -n 1 -d 3 -o +%CPU | sed -e '1,/PID/d' | head -4 | ts '[%Y-%m-%d %H:%M:%S]' >> /usr/local/bin/cpu_usage.log

# This part requires lm-sensors to work install with:
#sudo apt install lm-sensors
printf "\r" >> /usr/local/bin/cpu_usage.log
echo "processor temperature " >> /usr/local/bin/cpu_usage.log
cat /sys/class/thermal/thermal_zone*/temp >> /usr/local/bin/cpu_usage.log

#The second part adds processor temperature readouts, useful to track environmental temperature concerns
#Remove three zeros on the larger number to get the temperature in degrees celsius
# To quickly convert Celsius to Fahrenheit, double the Celsius temperature and add 30. This provides a close estimate, 
#though not perfectly accurate for all temperatures. For a more precise conversion, multiply the Celsius temperature by 1.8 (or 9/5) and then add 32,

#This will output the top 4 processor memory hogs and append them to the cpu_usage log
#You must create cpu_usage.log in /usr/local/bin.  And you must add this to crontab by invoking sudo crontab -e.  It will not run properly otherwise
# add this line in crontab: @hourly /usr/local/bin/cpu7days.sh

#example output will look like this:
#[2025-08-23 01:32:30]  237635 root      20   0   16.2g   5.0g  96640 S 109.1  21.5 224:33.08 7DaysTo+
#[2025-08-23 01:32:30]  313873 root      20   0   16392   6656   4352 R   9.1   0.0   0:00.01 top
#[2025-08-23 01:32:30]       1 root      20   0   19516   9600   8448 S   0.0   0.0   0:15.41 systemd
#[2025-08-23 01:32:30]       2 root      20   0       0      0      0 S   0.0   0.0   0:00.08 kthreadd
#processor temperature
#8300
#36000

