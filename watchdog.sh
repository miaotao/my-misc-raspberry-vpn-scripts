#!/bin/bash 
export PATH="/bin:/sbin:/usr/sbin:/usr/bin"


server_list=(awssg1 tw3)

if [ -e /home/pi/vpn/vpn_on.mark ]
then
	for ss in ${server_list[@]}	
	do
		PPP0=`ifconfig |grep ppp0`
		if [ -z "$PPP0" ]
		then
			echo " staring ${ss} vpn"
			pon ${ss} 
		else
			exit
		fi

		sleep 60 
	done
else
	poff -a
fi
