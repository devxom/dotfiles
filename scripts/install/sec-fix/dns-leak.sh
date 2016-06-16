#!/bin/sh
# Set custom DNS WIndows (10) Powershell
# Check the DNS
ipconfig /all
# Set dns
# Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses 8.8.8.8
# "Cellular" name active network
netsh interface ip add dns name="Cellular" addr=8.8.4.4 index=1

# On Linux edit 
sudo nano /etc/resolv.conf

# DNS IP List
# Google public DNS
8.8.4.4
8.8.8.8
# OpenDNS
208.67.222.222
208.67.220.220
# OpenNic DNS
91.214.71.181
193.183.98.154
5.9.49.12
89.111.13.60
#Yandex Basic DNS
77.88.8.8
77.88.8.1
#Yandex Family (Virus & fraudulent content protection)
77.88.8.88
77.88.8.2
#Yandex Family (Without adult content) DNS
77.88.8.7
77.88.8.3
# ComodoDNS
8.26.56.26
8.20.247.20
# Norton Security: The most basic service that automatically blocks malware, phishing and scam sites
199.85.126.10
199.85.127.10
# Norton Security + Pornography: Adds blocking of sexually explicit material;
199.85.126.20
199.85.127.20
# Norton Security + Pornography + Other: Adds blocking of other mature content, like alcohol, crime, drugs and gambling
199.85.126.30
199.85.127.30
##DNS.WATCH
82.200.69.80
84.200.70.40
##Level3 DNS
209.244.0.3
209.244.0.4
4.2.2.1
4.2.2.2
4.2.2.3
4.2.2.4
##Comodo Secure DNS
8.26.56.26
8.20.247.20


