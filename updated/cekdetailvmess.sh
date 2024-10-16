#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
domain1=$(cat /etc/xray/domain)
MYIP=$(wget -qO- ipinfo.io/ip);
NUMBER_OF_CLIENTS=$(grep -E "^#vms# " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | wc -l)
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo " ================================="
	echo " Pilih Nomer Untuk Melihat Konfig"
	echo " Tekan CTRL+C untuk Kembali"
	echo " ================================="
	echo "     No User    Expired"
	grep -E "^#vms# " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | sort | uniq | column -t | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
clear
user=$(grep -E "^#vms# " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -o '"id": "[^"]*' /etc/xray/vmess-$user-tls.json | grep -o '[^"]*$')
## ubah config ke base64
vmess_base641=$( base64 -w 0 <<< $vmess_json1 )
vmess_base642=$( base64 -w 0 <<< $vmess_json2 )
vmess_base643=$( base64 -w 0 <<< $vmess_json3 )
xrayv2ray1="vmess://$(base64 -w 0 /etc/xray/vmess-$user-tls.json)"
xrayv2ray2="vmess://$(base64 -w 0 /etc/xray/vmess-$user-nontls.json)"
xrayv2ray3="vmess://$(base64 -w 0 /etc/xray/vmess-$user-grpc.json)"
echo -e ""
echo -e "======-XRAYS/VMESS-======"
echo -e "Remarks     : ${user}"
echo -e "IP/Host     : ${MYIP}"
echo -e "Address     : ${domain1}"
echo -e "Port TLS    : 443"
echo -e "Port No TLS : 80"
echo -e "User ID     : ${uuid}"
echo -e "Alter ID    : 0"
echo -e "Security    : auto"
echo -e "Network     : ws"
echo -e "Path        : /vmess/"
echo -e "Path GRPC   : vmess-grpc"
echo -e "========================="
echo -e "Link TLS    : ${xrayv2ray1}"
echo -e "========================="
echo -e "Link No TLS : ${xrayv2ray2}"
echo -e "========================="
echo -e "Link GRPC   : ${xrayv2ray3}"
echo -e "========================="
echo -e "Script Mod By andi64"