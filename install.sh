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
#          |  + Ｓｔａｔｓ３２   |
# MOTDstat is dynamicaly refreshing the /etc/motd file with current informations
# about system status and usage.
#
# Copyright 2017 Erreur32
# original project: Pavol Krigler <pavol.krigler@gelogic.net>
#
#   make sur this file is executable +x
################################################################################
#
# Installation
# ============
#
#      As root execute this command (the easy way!):
#
#           ./install.sh
#
################################################################################

## clean terminal
clear;

cat <<"EOF"

        Ｉｎｓｔａｌｌａｔｉｏｎ  ｏｆ  ＭＯＴＤｓ３２  |  +  Ｓｔａｔｓ３２   |

        ,--.   ,--. ,-----. ,--------.,------.         ,----.  ,---.
        |   `.'   |'  .-.  ''--.  .--'|  .-.  \  ,---. '.-.  |'.-.  \
        |  |'.'|  ||  | |  |   |  |   |  |  \  :(  .-'   .' ;  .-' .'
        |  |   |  |'  '-'  '   |  |   |  '--'  /.-'  `)/'-'  |/   '-.
        `--'   `--' `-----'    `--'   `-------' `----' `----' '-----'

   By  Ｅｒｒｅｕｒ３２

# MOTDstat is dynamicaly refreshing the /etc/motd file with current informations
# about system status and usage.

EOF

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo -e "\n\e[34mInstallation of ＭＯＴＤｓ３２ in progress... \e[0m"

## Install command in bashrc
echo "cat /etc/motd" >> /root/.bashrc

## Insdtall modules

if [ -f  "/etc/motds32/Stats32" ]
 then
   echo -e "  -->\e[34m  Stats32 already installed\e[0m"
 else
   mkdir /etc/motds32;
   cp  Stats32 /etc/motds32/Stats32 -Rf

fi

if [ -f  /usr/bin/motd ]
 then
    echo -e "  -->\e[34m  motd already installed\e[0m"
 else
   ln -s /usr/bin/motds32 /usr/bin/motd

fi

echo -e "\n  -->\e[34m Copy files  OK\n"
echo -e "\nDo you wish to install the required package?\n   --> apt-get install ntp figlet ? (y/n) "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    echo -e "\n1.\e[92m installation \e[0m  ntp figlet \e[92m start\e[0m" ;  #apt-get install -y  ntp figlet;
    echo -e "\n\e[92m apt-get installation \e[0m Succesfull"
    echo -e "\n start Makefile\n"
#    make install
    echo -e "\n Makefile \e[92m OK"
else
echo -e "\nDo you want to continue this installation? (y/n)\n "
old2_stty_cfg=$(stty -g)
stty raw -echo
answer2=$( while ! head -c 2 | grep -i '[ny]' ;do true ;done )
stty $old2_stty_cfg
  if echo "$answer2" | grep -iq "^y" ;then
  echo -e "\n1.\e[92m ok no apt-get required \e[0m Installation continue... \n";  #make install
 else
 exit 1
 fi
fi

## Install Crontab
 
crontab -l | grep -q '/usr/bin/motds32'  && echo 'entry exists' || echo -e "2.\e[92m Cron add ==> \e[0m */5 * * * *     /usr/bin/motds32 -g 2>1 \e[92m (generate each 5 minutes)\n" && crontab << FIN
$(crontab -l)

*/5 * * * *     /usr/bin/motds32 -g 2>1
FIN

## todo
###  MOTDs32 generation (5 min)
#/5 * * * *     /usr/bin/motds32 -g 2>1
###



## Generate first stats
/usr/bin/motds32 -g

echo -e "\n3.\e[92mMOTDs32 Installation completed!\e[0m  \n  Use: /usr/bin/motds32 for help\n"

exit 0
#EOF
