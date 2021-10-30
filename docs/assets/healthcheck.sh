#!/bin/bash
red='\033[0;31m'
green='\033[0;32m'
blue='\033[1;34m'
normal='\033[0m'

echo -e "\n"
echo -e "${blue}***********************${normal}"
echo -e "${blue}*${normal} Process Healthcheck ${blue}*${normal}"
echo -e "${blue}***********************${normal}"

processQuery(){
    if [ -z "$1" ] && [ -z "$2" ]
    then
    echo "Please parse in a process name and a process string to query!"
    else
        if [ -z "$3" ]
        then
            if ! [ $(ps -ef | grep "$2" | grep -v grep | wc -l) -eq 0 ]
            then
                echo -e "${green}$1 OK${normal}"
            else
                echo -e "${red}$1 Not OK${normal}"
            fi
        else
            if ! [ $(ps -ef | grep "$2" | grep "$3" | grep -v grep | wc -l) -eq 0 ]
            then
                echo -e "${green}$1 OK${normal}"
            else
                echo -e "${red}$1 Not OK${normal}"
            fi
        fi
    fi
}
echo -e "\n[Services]"
processQuery "[Container]\t\t podman" "podman" "root"
echo -e "\n"