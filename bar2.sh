#!/usr/bin/env bash 

#############################################################################
###########################################################################
###
### Modified/Rewritten by A.M.Danischewski (c) 2015 v1.1
### Issues: If you find any issues emai1 me at my <first name> dot 
###         <my last name> at gmail dot com.  
###
### Based on scripts posted by Pez Cuckow, William Pursell at:  
### http://stackoverflow.com/questions/12498304/using-bash-to-display-\
###      a-progress-working-indicator
###
### This program runs a program passed in and outputs a timing of the 
### command and it exec's a new fd for stdout so you can assign a 
### variable the output of what was being run. 
### 
### This is a very new rough draft but could be expanded. 
### 
### This program is free software: you can redistribute it and/or modify
### it under the terms of the GNU General Public License as published by
### the Free Software Foundation, either version 3 of the License, or
### (at your option) any later version.
###
### This program is distributed in the hope that it will be useful,
### but WITHOUT ANY WARRANTY; without even the implied warranty of
### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
### GNU General Public License for more details.
###
### You should have received a copy of the GNU General Public License
### along with this program.  If not, see <http://www.gnu.org/licenses/>.
###########################################################################
#############################################################################

declare    CMD="${1}"
shift      ## Clip the first value of the $@, the rest are the options. 
declare    CMD_OPTIONS="$@"
declare    CMD_OUTPUT=""
declare    TMP_OUTPUT="/tmp/_${0##*/}_$$_$(date +%Y%m%d%H%M%S%N)" 
declare -r SPIN_DELAY="0.1"
declare -i PID=

function usage() {
cat <<EOF

Description: ${0##*/}

This program runs a program passed in and outputs a timing of the 
command and it exec's a new fd for stdout so you can assign a variable 
the output of what was being run. 

Usage: ${0##*/} <command> [command options]

 E.g.  
    >$ ${0##*/} sleep 5 \&\& echo "hello" \| figlet
     Running: sleep 5 && echo hello | figlet, PID 2587:/

     real   0m5.003s
     user   0m0.000s
     sys    0m0.002s
      _          _ _       
     | |__   ___| | | ___  
     | '_ \ / _ \ | |/ _ \ 
     | | | |  __/ | | (_) |
     |_| |_|\___|_|_|\___/ 

     Done..
    >$ var=\$(${0##*/} sleep 5 \&\& echo hi)
     Running: sleep 5 && echo hi, PID 32229:-
     real   0m5.003s
     user   0m0.000s
     sys    0m0.001s
     Done..
     >$ echo \$var
     hi

EOF
} 

function spin_wait() { 
 local -a spin 
 spin[0]="-"
 spin[1]="\\"
 spin[2]="|"
 spin[3]="/"
 echo -en "Running: ${CMD} ${CMD_OPTIONS}, PID ${PID}: " >&3
 while kill -0 ${PID} 2>/dev/random; do
   for i in "${spin[@]}"; do
     echo -ne "\b$i" >&3
     sleep ${SPIN_DELAY}
   done
 done
} 

function run_cmd() { 
 exec 3>$(tty)
 eval "time ${CMD} ${CMD_OPTIONS}" 2>>"${TMP_OUTPUT}" | tee "${TMP_OUTPUT}" & 
 PID=$! # Set global PID to process id of the command we just ran. 
 spin_wait
 echo -en "\n$(< "${TMP_OUTPUT}")\n" >&3 
 echo -en "Done..\n" >&3
 rm "${TMP_OUTPUT}"
 exec 3>&-
} 

if [[ -z "${CMD}" || "${CMD}" =~ ^-. ]]; then 
 usage | more && exit 0 
else 
 run_cmd  
fi 

exit 0 