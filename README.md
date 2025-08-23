# 7daysscripts
scripts for 7days server owners

This is intended for linux server owners to aid in running 7days as a service and automating backup and restart tasks

I am in process of building things out and locking things down so these files and setup are a work in progress.

boot.config is located in the server install folder in 7DaysToDieServer_data.  This file has all the options available populated.  Extra memory assignment will help keep stuff from hitting the harddrive.

With these scripts I have the scripts set to run as superuser in crontab and are listed as follows in crontab:
0 5 * * * /usr/local/bin/backup.sh
@reboot sleep 120 && service 7days restart
@hourly /usr/local/bin/cpu7days.sh
@weekly /usr/local/bin/cleanlog.sh
@weekly /usr/local/bin/cleanbackup.sh
@weekly /usr/local/bin/outputlogclean.sh

To add to crontab just run:
sudo crontab -e
Save the lines in your crontab in a separate file in case you have to rebuild the files in case you accidentally run sudo crontab -r which resets the crontab file to defaults.

Each script will need to have the executable permission added and that can be done with this:
cd /usr/local/bin
sudo chmod +x cpu7days.sh
sudo chmod +x backup.sh
sudo chmod +x cpu7days.sh
sudo chmod +x cleanlog.sh
sudo chmod +x cleanbackup.sh
sudo chmod +x outputlogclean.sh

Once you have the service file 7days.service placed in /etc/systemd/system
You can run the game as a service.  So stopping and starting can be done by either:
sudo service 7days restart
sudo service 7days start
sudo service 7days stop
sudo service 7days status

sudo systemctl restart 7days
sudo systemctl stop 7days
sudo systemctl start 7days
sudo systemctl status 7days

Running it as a service like this increases the likelihood of getting a clean shutdown.  I have added options to the service file to stop an open files limit override.  I have also set it to only launch on startup after networking has been enabled and wait to launch on boot for 1 minute.

You can also directly kill it if you want via top with top running hitting q and enter the process id number (PID) and entering the appropriate signal number of usually 15 or 9.  And it should restart automatically.

If you have questions or issues you can hit me up on the funpimp forums (https://community.thefunpimps.com) to knoxvilles_joker.
