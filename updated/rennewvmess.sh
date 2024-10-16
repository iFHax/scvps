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
function con() {
    local -i bytes=$1;
    if [[ $bytes -lt 1024 ]]; then
        echo "${bytes}B"
    elif [[ $bytes -lt 1048576 ]]; then
        echo "$(( (bytes + 1023)/1024 ))KB"
    elif [[ $bytes -lt 1073741824 ]]; then
        echo "$(( (bytes + 1048575)/1048576 ))MB"
    else
        echo "$(( (bytes + 1073741823)/1073741824 ))GB"
    fi
}
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/AkbarStoreVPN/perizinan/main/ipvps.txt | grep $MYIP )
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}Telegram : https://t.me/liz_mine"
exit 0
fi
clear
NUMBER_OF_CLIENTS=$(grep -E "^#vms# " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | wc -l)
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^#vms# " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | sort | uniq | column -t | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done

user=$(grep -E "^#vms# " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vms# " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
byte=$(cat /etc/vmess/${user})
lim=$(con ${byte})

clear
echo -e ""
echo -e "==============================="
echo -e "      Account Information"
echo -e "==============================="
echo -e "${CLAY}Username : $user "
echo -e "Expired  : $exp ${NC}"
read -p "Limit User (GB): $lim"
echo -e "==============================="
read -p "Add Expired (Days): " masaaktif
read -p "Limit User (GB): " Quota
echo -e "Please Wait...."
sleep 3
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/#vms# $user $exp/#vms# $user $exp4/g" /etc/xray/config.json
sed -i "s/#vms# $user $exp/#vms# $user $exp4/g" /etc/xray/config.json

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))
e=$((${byte} + ${d}))

if [[ ${c} > "0" ]]; then
  echo "${e}" >/etc/vmess/${user}
fi
DATADB=$(cat /etc/vmess/.vmess.db | grep "^#vms#" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vmess/.vmess.db
fi
echo "#vms# ${user} ${exp4} ${uuid} ${Quota}" >>/etc/vmess/.vmess.db
systemctl restart xray.service
service cron restart
clear
echo ""
echo "==============================="
echo "  XRAYS/Vmess Account Renewed  "
echo "==============================="
echo "Username  : $user"
echo "Expired   : $exp4"
echo "Limit User (GB): $lim"
echo "==============================="
echo "Script Mod By andi64"
