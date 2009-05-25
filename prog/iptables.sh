#!/bin/sh
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
iptables="/sbin/iptables"

case "$1" in
start)
	echo -n "Starting IPtables..."
	# general /proc security
	if [ -e /proc/sys/net/ipv4/tcp_syncookies ]; then echo 1 > /proc/sys/net/ipv4/tcp_syncookies; fi
	if [ -e /proc/sys/net/ipv4/conf/all/rp_filter ]; then echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter; fi
 
	# flush any existing chains and set default policies
	$iptables -X
	$iptables -F INPUT
	$iptables -F OUTPUT
	$iptables -P INPUT DROP
	$iptables -P OUTPUT ACCEPT
	$iptables -Z
 
	# allow all packets on the loopback interface
	$iptables -A INPUT -i lo -j ACCEPT
	$iptables -A OUTPUT -o lo -j ACCEPT
 
	# allow established and related packets back in
	$iptables -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
 
	# blocking reserved private networks incoming from the internet
	#$iptables -I INPUT -i eth0 -s 10.0.0.0/8 -j DROP
	#$iptables -I INPUT -i eth0 -s 172.16.0.0/12 -j DROP
	#$iptables -I INPUT -i eth0 -s 192.168.0.0/16 -j DROP
	#$iptables -I INPUT -i eth0 -s 127.0.0.0/8 -j DROP
 
	# allow ICMP
	$iptables -A OUTPUT -p icmp -m state --state NEW -j ACCEPT
	$iptables -A INPUT -p icmp -m state --state ESTABLISHED,RELATED -j ACCEPT
	$iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -i eth0 -j ACCEPT

	# drop ICMP
	$iptables -I INPUT -p icmp --icmp-type redirect -j DROP
	$iptables -I INPUT -p icmp --icmp-type router-advertisement -j DROP
	$iptables -I INPUT -p icmp --icmp-type router-solicitation -j DROP
	$iptables -I INPUT -p icmp --icmp-type address-mask-request -j DROP
	$iptables -I INPUT -p icmp --icmp-type address-mask-reply -j DROP
 
	# Web
	$iptables -A INPUT -p tcp --dport 80 -j ACCEPT
	$iptables -A INPUT -p tcp --dport 81 -j ACCEPT
	$iptables -A INPUT -p tcp --dport 443 -j ACCEPT
	$iptables -A INPUT -p tcp --dport 2812 -j ACCEPT

	# SQL
	$iptables -A INPUT -p tcp --dport 3306 -j ACCEPT
	$iptables -A INPUT -p tcp --dport 5432 -j ACCEPT

	# Mail
	$iptables -A INPUT -p tcp --dport 143 -j ACCEPT
	$iptables -A INPUT -p tcp --dport 110 -j ACCEPT
	$iptables -A INPUT -p tcp --dport 25 -j ACCEPT
	
#	$iptables -A INPUT -p tcp --dport 10000 -j ACCEPT

	# SSH
	$iptables -A INPUT -p tcp --dport 22 -j ACCEPT

	# DNS
	$iptables -A INPUT -p tcp --dport 53 -j ACCEPT
	$iptables -A INPUT -p udp --dport 53 -j ACCEPT

	# Torrent
#	$iptables -A INPUT -p tcp --dport 49160:49300 -j ACCEPT

	# drop all other packets
	$iptables -A INPUT -i eth0 -p tcp --dport 0:65535 -j DROP
	$iptables -A INPUT -i eth0 -p udp --dport 0:65535 -j DROP

	echo "done."
	;;

stop)
	echo -n "Stopping IPtables..."

	$iptables -X
	$iptables -F
	$iptables -Z

	$iptables -A INPUT -p tcp -j ACCEPT 
	$iptables -A INPUT -p udp -j ACCEPT
	$iptables -P INPUT ACCEPT
	
	echo "done."
	;;

restart)
	echo -n "Restarting IP Firewall and NAT..."
	$0 stop > /dev/null
	sleep 1
	$0 start > /dev/null
	;;

*)
	echo "Usage: $0 {start|stop|restart}"
	;;
esac

