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
#        #   ./install.sh
#      or
#        #   bash install.sh
#
#
################################################################################
# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   /bin/echo "This script must be run as root" 1>&2
   exit 1
fi

## clean terminal
#clear;
BG_BLUE="$(tput setab 4)"
BG_BLACK="$(tput setab 0)"
FG_GREEN="$(tput setaf 2)"
FG_WHITE="$(tput setaf 7)"

# Save screen
tput smcup
# Display menu until selection == 0
while [[ $REPLY != 0 ]]; do
/bin/echo -n "${BG_BLACK}${FG_WHITE}"
clear
cat <<- "EOFMO"

        Ｉｎｓｔａｌｌａｔｉｏｎ  ｏｆ  ＭＯＴＤｓ３２  |  +  Ｓｔａｔｓ３２   |

        ,--.   ,--. ,-----. ,--------.,------.         ,----.  ,---.
        |   `.'   |'  .-.  ''--.  .--'|  .-.  \  ,---. '.-.  |'.-.  \
        |  |'.'|  ||  | |  |   |  |   |  |  \  :(  .-'   .' ;  .-' .'
        |  |   |  |'  '-'  '   |  |   |  '--'  /.-'  `)/'-'  |/   '-.
        `--'   `--' `-----'    `--'   `-------' `----' `----' '-----'

    By  Ｅｒｒｅｕｒ３２

EOFMO
/bin/echo -e "\033[1;30m # MOTDs32 is dynamicaly refreshing the /etc/motd file with current informations"
/bin/echo -e "\033[1;30m # about system status and usage."
/bin/echo -e "\n \e[34m  Installation of ＭＯＴＤｓ３２ in progress... \e[0m\n\n"

# Check dependenciess
/bin/echo -e "\e[34m Check required dependencies ! (need to be installed)"

# Check installed
    if [ -f  "/usr/sbin/sendmail" ]
      then
        /bin/echo -e "    \e[34m-  Posfix \e[92m OK\e[0m\n"
      else
        /bin/echo -e "    \e[34m-  Select option 1 \e[91m Missing package !! \e[0m\n"
     fi
 
   if  [ -f  "/usr/share/build-essential/essential-packages-list" ]
    then
  /bin/echo -e "    \e[34m-  build-dep       \e[32m✔ installed.\e[0m"
    else
  /bin/echo -e "    \e[34m-  build-dep       \e[1;31mSelect option 1 \e[91m Missing package !!\e[0m"
    fi


# Check files

if hash figlet 2>/dev/null; then
/bin/echo -e "    \e[34m-  Figlet          \e[32m✔ installed.\e[0m"
    else
/bin/echo -e "    \e[34m-  Figlet         \e[1;31m Select option 1 \e[91m Missing package !!\e[0m"
    fi
if hash ntpd 2>/dev/null; then
/bin/echo -e "    \e[34m-  NTP             \e[32m✔ installed.\e[0m"
    else
/bin/echo -e "    \e[34m-  NTP           \e[1;31mSelect option 1 \e[91m Missing package !!\e[0m"
    fi
if hash make 2>/dev/null; then
/bin/echo -e "    \e[34m-  build-essential \e[32m✔ installed.\e[0m"
    else
/bin/echo -e "    \e[34m-  build-essential  \e[1;31mSelect option 1 \e[91m Missing package !!\e[0m"
    fi


/bin/echo -e "\n        YOU CAN SKIP (auto) install if you want"
/bin/echo -e "\n\e[92m  Please Select:"
/bin/echo -e "        1. \e[0m(auto) Install Missing Package\e[92m"
/bin/echo -e "        2. \e[0mInstallation MOTDs32 script\e[92m"
/bin/echo -e "        3. \e[0mUninstall completly  MOTDs32 script\e[92m"
/bin/echo -e "        0. \e[0m(Enter or any key) to Quit\n \e[0m"
read -r -p "     Enter selection [0-3] or (Enter) to Quit > " selection


# Clear area beneath menu
tput cup 10 0
/bin/echo -n "${BG_BLACK}${FG_GREEN}"
tput ed
tput cup 11 0

# Act on selection
      case $selection in
        1)  /bin/echo -e " \e[32m install missing package  ...\e[0m\n"
            apt-get install  --allow-unauthenticated -y build-essential ntp figlet postfix sasl2-bin
            /bin/echo -e "\n\e[34m - apt-get installation build-essential ntp figlet \e[0m>> Succesfull"
     if [ -f "/usr/bin/motds32" ]
      then
      /bin/echo -e "\n\e[34m - Make file \e[0m>> founded.\e[0m\n"
      #make install
      #/bin/echo -e "\n\e[34m - REMake file done.\e[0m\n"
      else
      /bin/echo -e "\n\e[92m -Building binary \e[0m\n"
      make install
      /bin/echo -e "\n\e[34m - Make file done.\e[0m\n"
     fi

      /bin/echo -e "\e[92m"
        if [ `grep -c "/etc/motd" /root/.bashrc` == 0 ]
         then
            /bin/echo -e " \e[1;31m code bash missing"
            /bin/echo "cat /etc/motd" >> /root/.bashrc
            /bin/echo -e "\e[92m - Code bash \e[0madded.\n"
         else
           grepmot=`grep  '/etc/motd' /root/.bashrc`
           /bin/echo -e "  \e[1;30m Code bash found: \e[0m>>\e[0m $grepmot \e[0m<<\n"
           /bin/echo -e "  -->\e[34m  Code bash: \e[92mOK\e[0m"
        fi

 # Check if MOTDs32 is already add
	if test ! -d /etc/motds32; then mkdir -p /etc/motds32; fi

        if [ -f  "/etc/motds32/Stats32" ]
         then
           /bin/echo -e "  -->\e[34m  Stats32 \e[92mFOUND\e[0m"
           cp  Stats32 /etc/motds32/Stats32 -Rf
         else
          cp  Stats32 /etc/motds32/Stats32 -Rf
          /bin/echo -e "  -->\e[34m  Stats32 \e[92mINSTALLED\e[0m"
        fi

# Copy font figlet
        if [ -f  "/usr/share/figlet" ]
         then
           /bin/echo -e "  -->\e[31m  figlet not FOUND\e[0m"
         else
           cp -Rf fonts/chunky.flf /usr/share/figlet/
           /bin/echo -e "  -->\e[34m  Font figlet \e[92mOK\e[0m"
        fi

# Check if motd is installed correctly
        if [ -f  "/usr/bin/motd" ]
         then
           /bin/echo -e "  -->\e[34m  motd check \e[92mOK\e[0m\n"
         else
            ln -s /usr/bin/motds32 /usr/bin/motd
            /bin/echo -e "  -->\e[34m  motd bin \e[92mOK\e[0m\n"
        fi
## Install Crontab
        if crontab -l | grep -q '/usr/bin/motds32';  then
          /bin/echo -e " \e[34m -Cron \e[0m>> already added.\e[0m"
        else
          /bin/echo -e "\e[34m - Cron added.\e[0m"
        (crontab -l ; /bin/echo "*/5 * * * *      /usr/bin/motds32 -g 2>1")| crontab -
        fi
## Generate first stats
if test -f /usr/bin/motds32; then /usr/bin/motds32 -g; fi

      /bin/echo -e "\n\n\e[34m \e[92m  Ｉｎｓｔａｌｌａｔｉｏｎ  ｏｆ  ＭＯＴＤｓ３２ completed!\e[0m  \n\n\n Help? Use: \n \033[1;30m /usr/bin/motds32\e[0m \n or \033[1;30m\n  motd\e[0m\n"
      printf "\n   \e[1;33m  (Press 0 to exit)\e[0m"
      printf "\n   \e[1;33m  (Or any key to go back.)\e[0m" 
       ;;
        2)  /bin/echo -e "\n\e[92m"
        if [ `grep -c "/etc/motd" /root/.bashrc` == 0 ]
         then
            /bin/echo -e " code bash missing"
            /bin/echo "cat /etc/motd" >> /root/.bashrc
            /bin/echo -e "\e[92m - Code bash \e[0madded.\n"
         else
           grepmot=`grep  '/etc/motd' /root/.bashrc`
           /bin/echo -e "  \e[1;30m Code bash found: \e[0m>>\e[0m $grepmot \e[0m<<\n"
           /bin/echo -e "  -->\e[34m  Code bash: \e[92mOK\e[0m"
        fi

# Check if MOTDs32 is already add
        if test ! -d /etc/motds32; then mkdir -p /etc/motds32; fi
        
        if [ -f "/usr/bin/motds32" ]
      then
       /bin/echo -e "\n\e[34m - Make file \e[0m>> founded.\e[0m\n"
       #make install
       #/bin/echo -e "\n\e[34m - REMake file done.\e[0m\n"
      else
       /bin/echo -e "\n\e[92m -Building binary \e[0m\n"
       make install
       /bin/echo -e "\n\e[34m - Make file done.\e[0m\n"
     fi
     
        if [ -f  "/etc/motds32/Stats32" ]
         then
           /bin/echo -e "  -->\e[34m  Stats32 \e[92mFOUND\e[0m"
           cp  Stats32 /etc/motds32/Stats32 -Rf
         else
          cp  Stats32 /etc/motds32/Stats32 -Rf
          /bin/echo -e "  -->\e[34m  Stats32 \e[92mINSTALLED\e[0m"
        fi

# Copy font figlet
        if [ -f  "/usr/share/figlet" ]
         then
           /bin/echo -e "  -->\e[31m  figlet not FOUND\e[0m"
         else
           cp -Rf fonts/chunky.flf /usr/share/figlet/
           /bin/echo -e "  -->\e[34m  Font figlet \e[92mOK\e[0m"
        fi

 # Check if motd  ins talled correctly
        if [ -f  "/usr/bin/motd" ]
         then
           /bin/echo -e "  -->\e[34m  motd check \e[92mOK\e[0m\n"
         else
            ln -s /usr/bin/motds32 /usr/bin/motd
            /bin/echo -e "  -->\e[34m  motd bin \e[92mOK\e[0m\n"
        fi

## Install Crontab
        if crontab -l | grep -q '/usr/bin/motds32';  then
          /bin/echo -e "\e[34m - Cron \e[0m>> already added.\e[0m"
        else
          /bin/echo -e "\e[34m - Cron added.\e[0m"
          (crontab -l ; /bin/echo "*/5 * * * *      /usr/bin/motds32 -g 2>1")| crontab -
        fi
## Generate first stats
      if test -f /usr/bin/motds32; then /usr/bin/motds32 -g; fi

      /bin/echo -e "\n\n\e[34m \e[92m  Ｉｎｓｔａｌｌａｔｉｏｎ  ｏｆ  ＭＯＴＤｓ３２ completed!\e[0m  \n\n\n Help? Use: \n \033[1;30m /usr/bin/motds32\e[0m \n or \033[1;30m\n  motd\e[0m\n"
      printf "\n   \e[1;33m  (Press any key to exit.)\e[0m"
            ;;
        3)  /bin/echo -e "\n\e[34m Dsinstallation of ＭＯＴＤｓ３２ in progress... \e[0m"
## remove file and directory
          make uninstall
          rm /etc/motds32/ -Rf
          rm /usr/bin/motd -f
          rm /var/cache/motds32/ -Rf

## remove cron
         if crontab -l | grep -q '/usr/bin/motds32';  then
         /bin/echo -e "  \e[92m Cron localized\n"
    crontab -l | grep -v '/usr/bin/motds32 -g 2>1' | crontab -u root -
    /bin/echo -e "  \e[92m Cron removed\n"
    else
    /bin/echo -e "  \e[93m Cron not find\n"
    fi

    if [ `grep -c /etc/motd /root/.bashrc` = 0 ]
    then
     /bin/echo "  Code bash not founded"
    else
     /bin/echo "  code bash founded"
     sed -i '/cat \/etc\/motd/d' /root/.bashrc
     /bin/echo -e "\e[92m Code .bashrc remove.\e[0m"
     grep -n  '/etc/motd' /root/.bashrc
    fi

	/bin/echo -e "\n\e[92m Script ＭＯＴＤｓ３２ has been completly removed \e[0m"
	printf "\n   \e[1;33m  (Press any key.)\e[0m"
            ;;
        0)  break
            ;;
        *)  break
            ;;
      esac
      read -r -n 1

#      /bin/echo -e "\n\n\e[34m \e[92m  Ｉｎｓｔａｌｌａｔｉｏｎ  ｏｆ  ＭＯＴＤｓ３２ completed!\e[0m  \n\n\n Help? Use: \n \033[1;30m /usr/bin/motds32\e[0m \n or \033[1;30m\n  motd\e[0m\n"
#      printf "\n   \e[1;33m  (Press any key to exit.)\e[0m"

done

# Restore screen
tput rmcup
/bin/echo "Installation MOTDs32 terminated."
