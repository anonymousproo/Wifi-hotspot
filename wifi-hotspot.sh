#!/bin/bash
# credit: anonymous pro
#YTB : anonymous pro
# author: 

if [ -z "$1" ]; then
	echo -e "Usage guid:
		Enable: ./wifi-hotspot.sh <wifi interface> <ssid> <password>
		Disable: ./wifi-hotspot.sh -d"
	exit 1
fi

echo -e "

██╗    ██╗██╗███████╗██╗    ██╗  ██╗ ██████╗ ████████╗███████╗██████╗  ██████╗ ████████╗
██║    ██║██║██╔════╝██║    ██║  ██║██╔═══██╗╚══██╔══╝██╔════╝██╔══██╗██╔═══██╗╚══██╔══╝
██║ █╗ ██║██║█████╗  ██║    ███████║██║   ██║   ██║   ███████╗██████╔╝██║   ██║   ██║   
██║███╗██║██║██╔══╝  ██║    ██╔══██║██║   ██║   ██║   ╚════██║██╔═══╝ ██║   ██║   ██║   
╚███╔███╔╝██║██║     ██║    ██║  ██║╚██████╔╝   ██║   ███████║██║     ╚██████╔╝   ██║   
 ╚══╝╚══╝ ╚═╝╚═╝     ╚═╝    ╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚══════╝╚═╝      ╚═════╝    ╚═╝   
                                                                                        
"

if [ "$1" = "-d" ]; then
	echo "Disabling hostpot.........."
	sudo nmcli radio wwan off
	exit 0
fi

echo "SSID: $2"
echo "Password: $3"
echo -n "Are you sure Enable Hotspot? [Y/N]: "
read choice

if [ "$choice" = "Y" ] || [ "$choice" = "y" ]; then
	echo "Enabling hotspot $2.........."
	sudo nmcli dev wifi hotspot ifname $1 ssid $2 password $3
else
	echo "Quit.........."
	exit 0
fi
