(2017) New project was fork _MOTDstat_ https://bitbucket.org/hetii/motdstat

## MOTDs32 New Custom MOTD by  🅴🆁🆁🅴🆄🆁32

**MOTDs32** = MOTD + Stats32

# Project

 - new Project  https://gitlab.echosystem.fr/Erreur32/MOTDs32


```
,--.   ,--. ,-----. ,--------.,------.         ,----.  ,---.
|   `.'   |'  .-.  ''--.  .--'|  .-.  \  ,---. '.-.  |'.-.  \
|  |'.'|  ||  | |  |   |  |   |  |  \  :(  .-'   .' &lt;  .-' .'
|  |   |  |'  '-'  '   |  |   |  '--'  /.-'  `)/'-'  |/   '-.
`--'   `--' `-----'    `--'   `-------' `----' `----' '-----'

          |  +	Ｓｔａｔｓ３２   |
          
```          
         
- [Features](#features) 
- [Requirements](#requirements) 
- [Installation](#install)
- [Documentation](#documentation)
- [Sample motd32 Report](#sample-motd32-report) 
- [Stats git Repo](#stats-repo-)
- [License](#license) 


Features
--------
 - Add stats in SSH connection or in the shell 

Requirements
------------
- SHELL    >= bash: 4.3.30(1)
 
[Original project](http://www.gelogic.net/)
 

MOTDs32 is a fork of the excelent MOTDstat !

Usage: generate dynamicaly the /etc/motd file with current information about system resources and usage

Using crontab the script will periodically display status of system resources and services.

The original message of the day is now stored in /etc/motd.orig file.

Everytime you connect throught the SSH you will see some informations (customisable).
 
  
Install
-------

(See [install](https://gitlab.echosystem.fr/Erreur32/MOTDs32/blob/master/INSTALL)   file.)
 
 type inside the directory: 

```bash
$ ./install.sh
```
Answer: y (install the package if needed)

If you want some help, try this command in your shell: 

```
/usr/bin/motds32 
or
motd
```

Documentation
-------------


```bash
$  motd
Usage: motds32 OPTIONS
    -g, --generate    Check system status and generate it to /etc/motd file
    -s, --status      Show limited content of MOTD file
    -v, --version     Display information about motds32 version and author
    -m, --MotD32      See the MOTD file
```

You can see the result with :
```bash
$  cat /etc/motd
```

or
```bash
$  usr/bin/motds32 -c
```
or
```
$  motd -m
```

#You can set differents features in  /etc/motds32/motds32.conf

Update:
-------

need to redownload the last version form gitlab, do the following:
```bash
$ git clone https://gitlab.echosystem.fr/Erreur32/MOTDs32.git
$ cd MOTDs32
$ ./uninstall.sh
$ git pull
$ ./install.sh
```
 
--------------------------------------------------
 
Sample MOTD32 Report
--------------------

```bash
$  /usr/bin/motds32 -c
```
 
--------------------------------------------------

```bash
$ motd -m
Read motds32 file
        echosystem.fr  > status at 10:05 > 5min load is 0.82 on 8 cpu(s)

      Disk status        |      Memory status       |     Service status
partition      free  usg | Memory      used kB  [%] | service(s)        (count)
/              4,9G  74% | Memory:    59711808  90% | tcp/0.0.0.0:2222
/home          1,5T  12% | Swap:          3560   0% | tcp6/:::2222
                         | Buffers:    1271192      | tcp/0.0.0.0:25
                         | Cached:    51624824      | tcp6/:::25
                         |                          | tcp/127.0.0.1:8080
                         |                          | tcp6/:::80
                         |                          | tcp6/:::443
                         |                          | udp/37.187.162.229:123
                         |                          | udp/127.0.0.1:123
                         |                          | udp/0.0.0.0:123
                         |                          | udp6/fe80::ec4:7aff:fe0f:123
                         |                          | udp6/2001:41d0:d:2e5:::123
                         |                          | udp6/::1:123
             __                             __                      ___
.-----.----.|  |--.-----.-----.--.--.-----.|  |_.-----.--------.  .'  _|.----.
|  -__|  __||     |  _  |__ --|  |  |__ --||   _|  -__|        |__|   _||   _|
|_____|____||__|__|_____|_____|___  |_____||____|_____|__|__|__|__|__|  |__|
                              |_____|
/bin/bash : root

 10:05:39 up 66 days, 15:35,  2 users,  load average: 1,40, 0,79, 0,67
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
erreur32 pts/0    143.173.370.24   mar.15    2days  1.62s  0.26s sshd: erreur32 [priv]
erreur32 pts/1    2a01:e45:8ad3:7 08:57    4.00s  1.10s  0.01s sshd: erreur32 [priv]

Debian GNU/Linux 8.8 (jessie) (3.16.0-4-amd64).
Kernel Info:    Linux 3.16.0-4-amd64 x86_64

-----------     ---     ------------    ----------
System load :   1.40    IP Address:     55.147.132.243
Memory usage:   10.3%   System uptime:  66 days
Usage on /  :   74%     Swap usage:     0.0%
Local Users :   2       Processes:      282
-----------     ---     ------------    ----------

  vendredi 21 juillet 2017, 10:05:39 (UTC+0200)
```

Explanation of the report
-----

```bash
   system hostname              report time        system load
         |                          |                   |
         |      NTP status          |                   |  Number of CPU(s)
         |         |                |                   |      |
         V         V                V                   V      V                  
    echosystem.fr+-+  > status at 00:03 > 5min load is 0.75 on 8 cpu(s)</code></pre>
    
```

--------------------------------------------------

Stats Repo 
----------

 - https://echosystem.fr/MOTDs32
 - https://echosystem.fr/MOTDs32/32.html
 - https://echosystem.fr/MOTDs32/Stats/index.html
 

 
Powered by 🅴🆁🆁🅴🆄🆁32
 
<p>🅴🅲🅷🔵🆂🆈🆂🆃🅴🅼</p>
 
 