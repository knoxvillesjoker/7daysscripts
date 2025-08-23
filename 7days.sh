#!/bin/bash
nohup sh /home/7days/7days/startserver.sh -configfile=/home/7days/7days/serverconfig.xml -nographics -dedicated -quit

# this launches 7days as a service.  This is called specifically in a file at /etc/systemd/system/7days.service
# this script is placed in /usr/local/bin
