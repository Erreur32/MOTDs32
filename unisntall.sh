#!/bin/sh
#
# Removal script of MOTDs32
#
# make sur this file is executable +x


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

echo -e "\n\e[34m Dsinstallation of ＭＯＴＤｓ３２ in progress... \e[0m"


## remove all stuff

make uninstall
rm /etc/motds32/ -Rf
rm /usr/bin/motd -f

echo -e "\n\e[92m ＭＯＴＤｓ３２ removed \e[0m"
