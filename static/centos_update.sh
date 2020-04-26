#!/bin/bash
. common.lib

FILE="centos_update.sh"

DISTRO=$(sudo cat /etc/os-release | grep -w NAME | cut -d '"' -f 2)

echo "Do you wish to check for your ${DISTRO} updates now?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            sudo yum check-update -y; 
            frmfile; # remove THIS file
            break;;
        No ) 
            fbye; # bye message
            frmall; # remove all downloaded CLIMYID files
            exit;;
    esac
done
sleep 1
echo "Do you wish to upgrade it?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            sudo yum update -y; 
            sudo yum autoremove -y; 
            frmfile;
            break;;
        No ) 
            fbye;
            frmall;
            exit;;
    esac
done