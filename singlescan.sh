#!/bin/bash

item=$1


#Target
echo -e "$item"

#Set the field separator to new line
mkdir -p ~/scans-single_target

#Scans the target
echo "For loop over command output:"
cd ~/scans-single_target

echo $item

	if [ ! -d "$item" ]; then
		echo $item;
		mkdir -p $item
	fi

        ping $item -c 2 >> $item/$item-ICMP.txt
	sslscan $item >> $item/$item-sslscan.txt
	nikto -h $item >> $item/$item-nikto.txt
	curl -kv $item >> $item/$item-headers.txt
	nmap -sV -A $item >> $item/$item-nmap.txt
	sslscan $item >> $item/$item-sslscan.txt
done


