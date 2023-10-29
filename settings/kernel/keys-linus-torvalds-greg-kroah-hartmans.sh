#!/bin/bash
#set -e

##################################################################################################################
# Author  : Jonathan Marshall
# Github  : https://github.com/Dev8904
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

echo
tput setaf 2
echo "################################################################"
echo "################### Search for keys"
echo "################################################################"
tput sgr0
echo

gpg --search-keys ABAF11C65A2970B130ABE3C479BE3E4300411886

gpg --search-keys 647F28654894E3BD457199BE38DBBDC86092693E

echo
tput setaf 2
echo "################################################################"
echo "################### keys found"
echo "################################################################"
tput sgr0
echo