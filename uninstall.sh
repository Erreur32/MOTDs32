#!/bin/sh
#
# uninstall.sh
# Removal script of MOTDs32
#
# make sur this file is executable +x


## clean terminal
clear;

cat <<"EOF"

    Desiｎｓｔａｌｌａｔｉｏｎ  ｏｆ  ＭＯＴＤｓ３２  |  +  Ｓｔａｔｓ３２   |

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


## remove file and directory
make uninstall
rm /etc/motds32/ -Rf
rm /usr/bin/motd -f

## remove cron
if crontab -l | grep -q '/usr/bin/motds32';  then
echo -e "2.\e[92m Cron localized\n"
crontab -l | grep -v '/usr/bin/motds32 -g 2>1' | crontab -u root -
echo -e "2.\e[92m Cron removed\n"
else
echo -e "2.\e[93m Cron not find\n"
fi


if [ `grep -c /etc/motd /root/.bashrc` == 0 ]
then
echo "Code bash not founded"
#echo "cat /etc/motd" >> /root/.bashrc
#echo -e "\e[92m Code .bashrc added.\e[0m"
else
    echo "code bash founded"
sed -i '/cat \/etc\/motd/d' /root/.bashrc
echo -e "\e[92m Code .bashrc remove.\e[0m"
grep -n  '/etc/motd' /root/.bashrc
fi


echo -e "\n\e[92m Script ＭＯＴＤｓ３２ has been removed \e[0m"
