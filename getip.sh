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
hostname -I | awk '{print $1}'
