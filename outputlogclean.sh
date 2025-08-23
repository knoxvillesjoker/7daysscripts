#!/bin/bash

find /home/7days/7days/logs -maxdepth 1 -type f -printf '%Ts\t' -print0 \
| sort -rnz \
| tail -n +2 -z \
| cut -f2- -z \
| xargs -0 -r rm -f

#this will delete all output log files in the specified directory.  
#I run this once weekly to prevent file accumulations
#add to crontab with: @weekly /usr/local/bin/outputlogclean.sh
