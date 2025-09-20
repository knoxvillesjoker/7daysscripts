#!/bin/bash

expect /usr/local/bin/telnetlog.sh | tee -a /usr/local/bin/telnet.log
# add to crontab with sudo crontab -e and adding:
# @hourly /usr/local/bin/telnet.sh

# the below lines adds  filtering on the text stream so that only the number of players from the lp telnet command displays along with timestamp.
# this makes a much easier to read log file
# I could not get the carriage returns to get removed sed and awk did not seem to work like it was supposed to.

sed -i '/Connected with 7DTD server/d' /usr/local/bin/telnet.log
sed -i '/Server version: V 2.3 (b9) Compatibility Version: V 2.3/d' /usr/local/bin/telnet.log
sed -i '/Dedicated server only build/d' /usr/local/bin/telnet.log
sed -i '/Connection closed by foreign host./d' /usr/local/bin/telnet.log
sed -i '/exit/d' /usr/local/bin/telnet.log
sed -i '/spawn telnet localhost 8081/d' /usr/local/bin/telnet.log
sed -i '/Trying 127.0.0.1.../d' /usr/local/bin/telnet.log
sed -i '/Connected to localhost./d' /usr/local/bin/telnet.log
sed -i '/Escape character is/d' /usr/local/bin/telnet.log
sed -i '/Logon successful./d' /usr/local/bin/telnet.log
sed -i '/Please enter password:/d' /usr/local/bin/telnet.log
sed -i '/telnet/d' /usr/local/bin/telnet.log
sed -i '/Server/d' /usr/local/bin/telnet.log
sed -i '/Max/d' /usr/local/bin/telnet.log
sed -i '/Game mode/d' /usr/local/bin/telnet.log
sed -i '/World/d' /usr/local/bin/telnet.log
sed -i '/Game name/d' /usr/local/bin/telnet.log
sed -i '/Difficulty/d' /usr/local/bin/telnet.log
#sed -i '/lp/d' /usr/local/bin/telnet.log
sed -i '/osurocks/d' /usr/local/bin/telnet.log
#sed -e :a -e '$!N;s/\n[[:blank:]]\{1,\}/ /;ta' -e 'P;D' /usr/local/bin/telnet.log
#awk -vRS= '{$1=$1} 1' /usr/local/bin/telnet.log
