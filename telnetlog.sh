#!/usr/bin/


# Specify the log file
set log_filename "telnet.log"

# Open the log file for writing (appending with -a, or overwriting by default)
# To append: log_file -a $log_filename
# To overwrite: log_file $log_filename
log_file -a $log_filename


set timeout -1
spawn telnet localhost 8081
expect " "
send "serverpassword\n"


expect " " # wait for console prompt
send "lp\r" # this list players
sleep 1 # wait for command to finish
expect " "
send "exit\r"

expect eof
log_file
exit
