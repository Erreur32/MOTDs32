#!/bin/sh
#
#  MOTDs32 installation instructions
#  ==================================
#
# (2017) New project MOTDs32 by Erreur32
# Author:  Erreur32
# Version 0.0.5
#
#         https://gitlab.echosystem.fr/Erreur32/MOTDs32
#
# ,--.   ,--. ,-----. ,--------.,------.         ,----.  ,---.
# |   `.'   |'  .-.  ''--.  .--'|  .-.  \  ,---. '.-.  |'.-.  \
# |  |'.'|  ||  | |  |   |  |   |  |  \  :(  .-'   .' <  .-' .'
# |  |   |  |'  '-'  '   |  |   |  '--'  /.-'  `)/'-'  |/   '-.
# `--'   `--' `-----'    `--'   `-------' `----' `----' '-----'
#
#	   |  +	Ｓｔａｔｓ３２   |
# MOTDstat is dynamicaly refreshing the /etc/motd file with current informations
# about system status and usage.
#
# Copyright 2017 Erreur32 
# original project: Pavol Krigler <pavol.krigler@gelogic.net>
#
#
################################################################################
#
# Installation 
# ============
#
#      As root execute this command (the easy way!):
#
#           ./Install.sh
# 
################################################################################ 
 
## clean terminal 
clear;

## Install command in bashrc
echo "cat /etc/motd" >> /root/.bashrc 

## Insdtall modules
#mkdir /etc/motds32

if [ -e  /etc/motds32/Stats32]
 then
   echo -e "Stats32 already installed"
 else
   mkdir /etc/motds32;
   cp  Stats32 /etc/motds32/Stats32 -Rf
fi

if [ -e  /usr/bin/motd]
 then
    echo -e "motd already installed"
 else
   ln -s /usr/bin/motds32 /usr/bin/motd
   
fi

echo -e "Do you wish to install the missing package before (y/n)? \n   --> apt-get install ntp figlet ?"
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    echo -e "/n  OK installation start: ntp figlet" ;  apt-get install -y  ntp figlet; make install 
else
    echo -e "/n   No continue without";  make install 
fi


## Install Crontab
echo -e "\n \n Add ENTRY in ROOT crontab  (generation each 5 minutes)"

crontab << FIN
$(crontab -l)

###  MOTDs32 generation (5 min)
*/5 * * * *     /usr/bin/motds32 -g 2>1
###
FIN

## Generate first stats
/usr/bin/motds32 -g

#EOF 