#!/bin/bash

#list="One\ntwo\nthree\nfour"
list="nu.nl,tweakers.net"



#List with the targets
echo -e "echo: \n$list"

#Set the field separator to new line
IFS=$","
	if [ ! -d "scans_full_scan" ]; then
		mkdir ~/scans_full_scan
		echo "Scan folder made"
	fi
#Scans the target
echo "For loop over command output:"
cd ~/scans_full_scan

echo $list
for item in $list
do
	echo $item
		mkdir -p $item
        ping $item -c 2 >> $item/$item-ICMP.txt
	#sslscan $item >> $item/$item-sslscan.txt
	#nikto -h $item >> $item/$item-nikto.txt
	#curl -kv $item >> $item/$item-headers.txt
	#nmap -sV -A $item >> $item/$item-nmap.txt
	#sslscan $item >> $item/$item-sslscan.txt
done


