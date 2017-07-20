#!/bin/bash
#
# Installation of MOTDs32
# Author:  Erreur32
# Version 0.0.5
#
# MOTDstat is dynamicaly refreshing the /etc/motd file with current informations
# about system status and usage.
#
# Copyright 2017 Erreur32 
# original project: Pavol Krigler <pavol.krigler@gelogic.net>
#

clear;

echo -n "Do you wish to install the missing package before (y/n)?  --> apt-get install ntp figlet ?"
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    echo "/n ; Yes" ;  apt-get install -y  ntp figlet; make install 
else
    echo "/n ; No continue without";  make install 
fi



## Install command in bashrc
echo "cat /etc/motd" >> /root/.bashrc 


## Insdtall modules
#mkdir /etc/motds32
cp  Stats32 /etc/motds32/Stats32
ln -s /usr/bin/motds32  /usr/bin/motd

## Install Crontab
echo "add ENTRY in crontab  (generation each 5 minutes)"

crontab << FIN
$(crontab -l)

###  MOTDs32 generation (5 min)
*/5 * * * *     /usr/bin/motds32 -g 2>1
###
FIN

## Generate first stats
/usr/bin/motds32 -g

