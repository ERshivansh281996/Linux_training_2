#!/bin/bash
#Write a shell script to extract the IP address given the network
#interface name as a parameter.
#Eg.
#$ ./getip wlan0
#192.168.2.10
#$
#Include validity checking to verify that the user passed a valid interface (it
#should exist).
#-------------------------------------------------------------------------------------------------------------------#
nam=$1
s=$(ifconfig -s | awk '{print $1}'| grep $nam 2> /dev/null)
if [ "$s" = "$nam" ]
then
ifconfig $nam | awk '{print $2}' | awk 'NR == 2 {print}'
else
echo "No Interface"
fi
