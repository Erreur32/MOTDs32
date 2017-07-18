[![coverage report](https://gitlab.echosystem.fr/Erreur32/MOTDs32/badges/master/coverage.svg)](https://gitlab.echosystem.fr/Erreur32/MOTDs32/commits/master)

MOTDs32 installation instructions
==================================

 (2017) New project MOTDs32 by Erreur32

   https://gitlab.echosystem.fr/Erreur32/MOTDs32

    ,--.   ,--. ,-----. ,--------.,------.         ,----.  ,---.
    |   `.'   |'  .-.  ''--.  .--'|  .-.  \  ,---. '.-.  |'.-.  \
    |  |'.'|  ||  | |  |   |  |   |  |  \  :(  .-'   .' <  .-' .'
    |  |   |  |'  '-'  '   |  |   |  '--'  /.-'  `)/'-'  |/   '-.
    `--'   `--' `-----'    `--'   `-------' `----' `----' '-----'

	          |  +	Ｓｔａｔｓ３２   |



                              MOTDstat Documentation
================================================================================

Original project:
http://www.gelogic.net/ 

MOTDstat will dynamicaly generate the /etc/motd file with current 
information about system resources and usage. Using crontab the script will 
periodically display status of system resources and services. The original 
message of the day is now stored in /etc/motd.orig file.
     By configuring e-mail address you'll receive the notifications about 
following issues:

    o high CPU load (configurable warning/critical limits)
	o exceeding disk space (configurable warning/critical limits on 
          partitions)
	o intensive usage of SWAP space (configurable warning/critical limits)
	o specific process is not runnig
	o specific local network service is not running 
	o NTP is not synchronized with network peer(s) (ntpq is required)
	o too many e-mails in mail queue (mailq is required)
        o system reboot


     The system status report is organized into three columns:

	o 1st column contains information about partition(s) free space and 
          usage in percentage.
        o 2nd column will display information about used memory and SWAP space
        o 3rd column will monitor running processes and local network services

     You are able to modify the disk space warning and critical limits per 
mounted filesystem. First time you run the MOTDstat, the fstab_limits file will 
be generated with default warning and critical limit. You can setup the limits
by your needs. If some partition is not mounted, the notification e-mail will 
be send.


INSTALLATION: 
============
 (git clone https://gitlab.echosystem.fr/Erreur32/MOTDs32.git)
 
 type in the directory: 
       
       ./Install.sh
 
 UPDATE:
 ======

    cd /PATH/MOTDs32
    git pull


Customisation:
=============
When you want MOTD to be displayed while logging via SSH client you will
have to change setting on the SSH daemon as following: /etc/ssh/sshd_config

	~snip~
	PrintMotd yes
	~snip~

To apply the changes, restart the SSH server daemon.


Sample MOTDstat report
======================
```
       hosting.gelogic.net*+ > status at 19:15 > 5min load is 1.06 on 4 cpu(s)

      Disk status        |      Memory status       |     Service status      
partition      free  usg | Memory      used kB  [%] | services          (count)
/              2.7G  41% | Memory:     1013676  97% | tcp/192.168.7.13:80
/boot          100M  14% | Swap:             6   0% | tcp/192.168.7.13:443
/var            33G  11% | Buffers:     506268      | tcp/127.0.0.1:3306
/var/log       8.7G   4% | Cached:     2490812      | tcp/192.168.10.8:22
/tmp           4.4G   4% |                          | tcp/127.0.0.1:25
                         |                          | udp/127.0.0.1:161
                         |                          | udp/192.168.10.8:123
                         |                          | ntpd
                         |                          | httpd               (15)
                         |                          | mysqld              (2)
                         |                          | master

Explanation of the report
-------------------------

   system hostname              report time        system load
         |                          |                   |
         |      NTP status          |                   |  Number of CPU(s)
         |         |                |                   |      |
         V         V                V                   V      V                  
hosting.gelogic.net*+ > status at 19:15 > 5min load is 1.06 on 4 cpu(s)
```