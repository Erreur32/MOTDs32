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



if [ `grep -c /etc/motd /root/.bashrc` == 0 ]
then
    echo "code bash missing\n"
echo "cat /etc/motd" >> /root/.bashrc
echo -e "\e[92m Code bash added.\e[0m"
else
    echo "Code bash found" ; grep  '/etc/motd' /root/.bashrc
#sed -i '/cat \/etc\/motd/d' /root/.bashrc
#echo -e "\e[92m Code .bashrc remove.\e[0m"
fi
echo -ne '\e[0m##   (10%)\r'
sleep 1
echo -e "\n\n"
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
 
echo -e "  -->\e[34m  Copy files  OK\n"
echo -ne '\e[0m#########(50%)\r'
sleep 1
echo -ne "\n"
echo -e "\nDo you wish to install the required package?\n  \e[0m --> apt-get install ntp figlet ? (y/n) "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    echo -e "\n\e[92m apt-get install \e[0m  ntp figlet \e[94m start\e[0m\n" ;  apt-get install -y  ntp figlet;
    echo -e "\n\e[92mapt-get installation\e[0m Succesfull"
    if [ -f /usr/bin/motds32 ]
      then
      echo -e "\n\e[92m Make file done.\n"
     else 
      make install
      echo -e "\n\e[92m Make file done.\n"
     fi
else
echo -e "\n\e[34mDo you want to continue this installation? (y/n)\n "
old2_stty_cfg=$(stty -g)
stty raw -echo
answer2=$( while ! head -c 2 | grep -i '[ny]' ;do true ;done )
stty $old2_stty_cfg
  if echo "$answer2" | grep -iq "^y" ;then
  echo -e "\n\e[92m No apt-get required\e[0m Installation continue... \n";  make install
  else
   exit 1
  fi
fi

echo -ne '\e[0m##################(90%)\r'
sleep 1
echo -e "\n"
## Install Crontab

if crontab -l | grep -q '/usr/bin/motds32';  then
echo -e "\e[92m Cron already added."
else
echo -e "\e[92m Cron added."
(crontab -l ; echo "*/5 * * * *   root  /usr/bin/motds32 -g 2>1")| crontab -
fi
 
#crontab -l | grep -q '/usr/bin/motds32'  && echo 'entry exists' || echo -e "2.\e[92m Cron add ==> \e[0m */5 * * * *     /usr/bin/motds32 -g 2>1 \e[92m (generate each 5 minutes)\n" && */5 * * * *   root  /usr/bin/motds32 -g 2>1
#crontab << FIN
#$(crontab -l)
#
#*/5 * * * *     /usr/bin/motds32 -g 2>1
#FIN
## todo
###  MOTDs32 generation (5 min)
#/5 * * * *     /usr/bin/motds32 -g 2>1
###


## Generate first stats
/usr/bin/motds32 -g

echo -ne '\n\e[0m#######################(100%)\r\n\n'
echo -e "\n\e[34m \e[92m  Ｉｎｓｔａｌｌａｔｉｏｎ  ｏｆ  ＭＯＴＤｓ３２ completed!\e[0m  \n\nUse: /usr/bin/motds32 for help\n"
 
exit 0
#EOF
