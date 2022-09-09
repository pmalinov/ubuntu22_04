#!/bin/sh

######################## add in crontab ##########################
# Star on boot  sharing internet with nat and masquerading
## @reboot  /home/dell/My_Script/sharing_inernet/NAT_MASQUER_Share.sh > /tmp/0_LOG_NAT_MASQUER_Share


echo Star sharing internet with nat and masquerading
sleep 5

ifconfig enp9s0 down
sleep 1
ifconfig enx0c5b8f279a64 up
sleep 5
ifconfig enp9s0 10.42.0.1 netmask 255.255.255.0
ifconfig enp9s0 up
sleep 10
    pub_int="enx0c5b8f279a64"
    prv_int="enp9s0"

    echo 1 > /proc/sys/net/ipv4/ip_forward

    iptables -X
    iptables -F
    iptables -t nat -X
    iptables -t nat -F


    iptables -t nat -A POSTROUTING -o $pub_int -j MASQUERADE
    iptables -A FORWARD -i $pub_int -o $prv_int -m state --state RELATED,ESTABLISHED -j ACCEPT
    iptables -A FORWARD -i $prv_int -o $pub_int -j ACCEPT

    #route add -net default gw 192.168.8.1 netmask 255.255.255.0 dev enx0c5b8f279a64 metric 1
 echo "EXIT"   
exit
