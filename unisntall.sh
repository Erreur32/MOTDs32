#!/bin/sh
#
# Removal script of MOTDs32
#
# make sur this file is executable +x


## remove all stuff

make uninstall
rm /etc/motds32/ -Rf
rm /usr/bin/motd -f

