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
domain=$(cat /etc/xray/domain)
tr="$(cat ~/log-install.txt | grep -w "XRAYS TROJAN WS TLS" | cut -d: -f2|sed 's/ //g')"
MYIP=$(wget -qO- ipinfo.io/ip);
NUMBER_OF_CLIENTS=$(grep -E "^### " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | wc -l)
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
	grep -E "^^#&# " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | sort | uniq | column -t | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
clear
user=$(grep -E "^#&# " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#&# " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -w "password" "/etc/xray/config.json")


systemctl restart xray.service
#buattrojan
trojanlinkgrpc="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlinkws="trojan://${uuid}@${domain}:443?path=/xraytrojanws&security=tls&host=bug.com&type=ws&sni=bug.com#${user}"
service cron restart
clear
echo -e ""
echo -e "======-XRAYS/TROJAN-======"
echo -e "Remarks  : ${user}"
echo -e "IP/Host  : ${MYIP}"
echo -e "Address  : ${domain}"
echo -e "Port     : ${tr}"
echo -e "Key      : ${uuid}"
echo -e "Expired  : $exp"
echo -e "=========================="
echo -e "Link Trojan WS  : ${trojanlinkws}"
echo -e "=========================="
echo -e "Link Trojan GRPC : ${trojanlinkgrpc}"
echo -e "=========================="
echo -e "Script Mod By andi64"
