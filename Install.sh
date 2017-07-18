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

echo -n "Do you wish to install the missing package (y/n)? "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    echo "Yes let's go" ;    apt-get install -y  ntp figlet 
else
    echo "No continue without";  make install 

fi


## install missing package
# apt-get install -y  ntp figlet 

## start Installation

#make install
cp  Stats32 /etc/motds32/Stats32

## Install Crontab

echo "add in crontab --> */5 * * * *  /usr/bin/motds32 -g (generation each 5 minutes)"
#crontab << FIN
#$(crontab -l)

###  MOTDs32 generation
#*/5 * * * *   /etc/motds32/Stats32  > /etc/motds32/Stats32.txt |  /usr/bin/motds32 -g 2>1
###
#FIN

/usr/bin/motds32 -g

