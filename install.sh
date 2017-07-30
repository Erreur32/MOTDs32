#!/bin/sh
#
#  MOTDs32 installation instructions
#  ==================================
#
# (2017) New project MOTDs32 Customized by Erreur32
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
#
# MOTDstat is dynamicaly refreshing the /etc/motd file with current informations
# about system status and usage.
#
# Copyright 2017 🅴🆁🆁🅴🆄🆁32
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

EOF

echo -e "\033[1;30m# MOTDs32 is dynamicaly refreshing the /etc/motd file with current informations"
echo -e "\033[1;30m# about system status and usage."



# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo -e "\n\e[34mInstallation of ＭＯＴＤｓ３２ in progress... \e[0m\n\n"

## Install command in bashrc

#echo -ne '\e[0m # (5%)\r'
#sleep 1
#echo -e "\n\n"

if [ `grep -c /etc/motd /root/.bashrc` == 0 ]
then
    echo -e " code bash missing"
echo "cat /etc/motd" >> /root/.bashrc
echo -e "\e[92m - Code bash \e[0madded.\n"
else
grepmot=`grep  '/etc/motd' /root/.bashrc`
    echo -e "  \e[1;30m Code bash found: \e[0m>>\e[0m $grepmot \e[0m<<\n"
    echo -e "  -->\e[34m  Code bash: \e[92mOK\e[0m"
#sed -i '/cat \/etc\/motd/d' /root/.bashrc
#echo -e "\e[92m Code .bashrc remove.\e[0m"
fi

## Insdtall modules
command -v figlet >/dev/null 2>&1 || { echo >&2 "Figlet is not installed."; echo "need to install figlet /y"; }
if [ -f  "/usr/share/figlet" ]
 then
   echo -e "  -->\e[31m  figlet not FOUND\e[0m"
 else
   echo -e "  -->\e[34m  Copy font figlet \e[92mOK\e[0m"
 cp -Rf fonts/chunky.flf /usr/share/figlet/ 
fi

# Check if MOTDs32 is already add
if [ -f  "/etc/motds32/Stats32" ]
 then
   echo -e "  -->\e[34m  Stats32 \e[92mFOUND\e[0m"
 else
    mkdir /etc/motds32;
   cp  Stats32 /etc/motds32/Stats32 -Rf
  echo -e "  -->\e[34m  Stats32 \e[92mINSTALLED\e[0m"  
fi

# Check files
echo -e "  -->\e[34m  Check files:\n"
#echo -ne '\e[0m #########(50%)\r'
#sleep 1
#echo -ne "\n"
command -v figlet >/dev/null 2>&1 || { echo >&2 "Figlet is not installed."; }
command -v ntpd >/dev/null 2>&1 || { echo >&2 "ntp is not installed."; }
command -v make >/dev/null 2>&1 || { echo >&2 "build-essential is not installed."; }
echo -e "\n\e[92m"
echo -e "\nDo you wish to install the required package?\n  \e[0m --> apt-get install ntp figlet build-essential ? (y/n) "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    echo -e "\n\e[34m - apt-get install ntp figlet build-essential \e[0m>>\e[92m starting\e[0m\n" ;  apt-get install -y build-essential ntp figlet;
    echo -e "\n\e[34m - apt-get installation \e[0m>> Succesfull\n"
     if [ -f "/usr/bin/motds32" ]
      then
      echo -e "\n\e[34m - Make file \e[0m>> already done.\e[0m\n"
     else 
      echo -e "\n\e[92m -Building binary \e[0m\n"
      make install
      echo -e "\n\e[34m - Make file done.\e[0m\n"
     fi
else
echo -e "\n\e[34mDo you want to continue this installation? (y/n)\n "
old2_stty_cfg=$(stty -g)
stty raw -echo
answer2=$( while ! head -c 2 | grep -i '[ny]' ;do true ;done )
stty $old2_stty_cfg
  if echo "$answer2" | grep -iq "^y" ;then
  echo -e "\n\e[34m - NO apt-get required\e[0m Installation continue... \n";  
    if [ -f "/usr/bin/motds32" ]
      then
      echo -e "\n\e[34m - Make file \e[0m>> Succesfull\n"
     else 
      echo -e "\n\e[94m -Building binary \e[0m\n"
      make install
      echo -e "\n\e[34m - Make file done.\e[0m\n"
     fi
  else
   exit 1
  fi
fi


# Check motd
if [ -f  "/usr/bin/motd" ]
 then
   echo -e "  -->\e[34m  motd check \e[92mOK\e[0m\n"
 else
    ln -s /usr/bin/motds32 /usr/bin/motd
    echo -e "  -->\e[34m  motd bin \e[92mOK\e[0m\n"
fi


#echo -ne '\e[0m ##################(90%)\r'
#sleep 1
#echo -e "\n"


## Install Crontab

if crontab -l | grep -q '/usr/bin/motds32';  then
echo -e "\e[34m - Cron \e[0m>> already added.\e[0m"
else
echo -e "\e[34m - Cron added.\e[0m"
(crontab -l ; echo "*/5 * * * *      /usr/bin/motds32 -g 2>1")| crontab -
fi
 
 

## Generate first stats
/usr/bin/motds32 -g

#echo -ne '\n\e[0m #######################(100%)\r\n\n'
echo -e "\n\n\e[34m \e[92m  Ｉｎｓｔａｌｌａｔｉｏｎ  ｏｆ  ＭＯＴＤｓ３２ completed!\e[0m  \n\n\n Help? Use: \n \033[1;30m /usr/bin/motds32\e[0m \n or \033[1;30m\n  motd\e[0m\n"
 
exit 0
#EOF
