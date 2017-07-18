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
===========================

Original project:
http://www.gelogic.net/ 

MOTDstat will dynamicaly generate the /etc/motd file with current 
information about system resources and usage. Using crontab the script will 
periodically display status of system resources and services. The original 
message of the day is now stored in /etc/motd.orig file.



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