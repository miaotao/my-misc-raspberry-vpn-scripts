#Reference

Used chnroutes: https://github.com/jimmyxu/chnroutes/



#Step 1:


sudo apt-get install pptp-linux


using pptpsetup command to add your own vpn connect:

sudo pptpsetup --create YOUR_NAME --server VPN_SERVER_HERE --username USER_NAME --password PASSWORD --encrypt



#Step 2:

sudo ln -s $PWD/vpn-forward /etc/ppp/ip-up.d/999vpn-forward

./chnroutes.py -p linux

sudo ln -s $PWD/ip-pre-up /etc/ppp/ip-up.d/999ip-pre-up

sudo ln -s $PWD/ip-down /etc/ppp/ip-down.d/999ip-down

sudo ln -s $PWD/iptables.rules /etc/iptables.rules

sudo ln -s $PWD/iptables /etc/network/if-up.d/999iptables



#Step 3:

Modify /etc/crontab, at the last line, add:

*/10 *  * * * root	/home/pi/vpn/watchdog.sh



#Step 4:

Modify watchdog.sh,  use you created server instead.

server_list=(usd3 jp2 tw5)



#Setp 5:

Modify /etc/sysctl.conf

# Uncomment the next line to enable packet forwarding foar IPv4

net.ipv4.ip_forward=1



#Step 6:

(Optional) Set up dnsmasq

sudo apt-get install dnsmasq



Modify /etc/dnsmasq.conf, uncommit: 

resolv-file=/home/pi/vpn/resolv.conf

strict-order
