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
00:03:47 19/07 root@echosystem .../Stats-tools/MOTDs32 (master)# /usr/bin/motds32 -c

motds32 check motd file
        echosystem.fr  > status at 00:03 > 5min load is 0.75 on 8 cpu(s)

      Disk status        |      Memory status       |     Service status
partition      free  usg | Memory      used kB  [%] | service(s)        (count)
/              5,9G  68% | Memory:    61431116  92% | tcp/0.0.0.0:2222
/home          1,5T  12% | Swap:          3500   0% | tcp6/:::2222
                         | Buffers:    1266580      | tcp/0.0.0.0:25
                         | Cached:    50682196      | tcp6/:::25
                         |                          | tcp/127.0.0.1:8080
                         |                          | tcp6/:::80
                         |                          | tcp6/:::443
                         |                          | udp/37.187.162.229:123
                         |                          | udp/127.0.0.1:123
                         |                          | udp/0.0.0.0:123
                         |                          | udp6/fe80::ec4:7aff:fe0f:123
                         |                          | udp6/2001:41d0:d:2e5:::123
                         |                          | udp6/::1:123

Explanation of the report
-------------------------

   system hostname              report time        system load
         |                          |                   |
         |      NTP status          |                   |  Number of CPU(s)
         |         |                |                   |      |
         V         V                V                   V      V                  
hosting.gelogic.net*+ > status at 19:15 > 5min load is 1.06 on 4 cpu(s)
```