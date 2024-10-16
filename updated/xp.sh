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
# MYIP=$(wget -qO- ipinfo.io/ip);
# echo "Checking VPS"
# IZIN=$( curl https://raw.githubusercontent.com/AkbarStoreVPN/perizinan/main/ipvps.txt | grep $MYIP )
# if [ $MYIP = $MYIP ]; then
# echo -e "${NC}${GREEN}Permission Accepted...${NC}"
# else
# echo -e "${NC}${RED}Permission Denied!${NC}";
# echo -e "${NC}${LIGHT}Please Contact Admin!!"
# echo -e "${NC}${LIGHT}Telegram : https://t.me/lizadm"
# exit 0
# fi

# CODE AKUN XRAY DI /etc/xray/config.json
# ====================
# vmess = ###
# vless = ####
# trojan = #&#
# shadowsocks = ##&#
# ====================
clear
# Delete vmess expired
data=$(grep -E "^### " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2)
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq )
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
rm -f /etc/xray/vmess-$user-tls.json /etc/xray/vmess-$user-nontls.json
fi
done
# Delete Vless
data=( `cat /etc/xray/config.json | grep '^####' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^#### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq )
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^#### $user $exp/,/^},{/d" /etc/xray/config.json
fi
done
# Delete trojan
systemctl restart xray.service
data=( `cat /etc/xray/config.json | grep '^#&#' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^#&# $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq )
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^#&# $user $exp/,/^},{/d" /etc/xray/config.json
fi
done
# Delete shadowsocks
data=( `cat /etc/xray/config.json | grep '^##&#' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^##&# $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq )
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^##&# $user $exp/,/^},{/d" /etc/xray/config.json
fi
done
##------ Auto Remove SSH
hariini=`date +%d-%m-%Y`
cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
totalaccounts=`cat /tmp/expirelist.txt | wc -l`
for((i=1; i<=$totalaccounts; i++ ))
do
tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
username=`echo $tuserval | cut -f1 -d:`
userexp=`echo $tuserval | cut -f2 -d:`
userexpireinseconds=$(( $userexp * 86400 ))
tglexp=`date -d @$userexpireinseconds`             
tgl=`echo $tglexp |awk -F" " '{print $3}'`
while [ ${#tgl} -lt 2 ]
do
tgl="0"$tgl
done
while [ ${#username} -lt 15 ]
do
username=$username" " 
done
bulantahun=`echo $tglexp |awk -F" " '{print $2,$6}'`
todaystime=`date +%s`
if [ $userexpireinseconds -ge $todaystime ] ;
then
:
else
userdel --force $username
fi
done
systemctl restart xray.service