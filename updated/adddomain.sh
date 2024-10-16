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
#Getting
MYIP=$(wget -qO- ipinfo.io/ip);

error1="${RED} [ERROR] ${NC}"
success="${GREEN} [OK] ${NC}"
#Domain lama
source /var/lib/akbarstorevpn/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
clear
echo -e "========================="
read -rp "Input Domain/Host : " -e domain
echo -e "========================="
echo -e "Domain di tambahkan: ${BLUE}${domain} ${NC}Please Wait..."
echo -e "========================="
sleep 3

# Cek DNS terubung dengan VPS atau tidak
cekdomain=$(curl -sm8 http://ipget.net/?ip="${domain}")
if [[ ${MYIP} == ${cekdomain} ]]; then
     clear
     echo -e "${success}Domain: ${BLUE}${domain} ${NC}Terhubung dengan IP VPS"
     sleep 3
 else
     clear
     echo -e "${error1}Domain: ${BLUE}${domain} ${NC}Tidak Terhubung dengan IP VPS"
     sleep 3
     exit 0
fi
# Done
echo $domain >> /etc/xray/domain
echo $domain >> /root/domain
echo "IP=$domain" >> /var/lib/akbarstorevpn/ipvps.conf
#Bersihkan terminal
clear
sleep 1

apt install curl socat xz-utils wget apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y 
apt install socat cron bash-completion ntpdate -y
ntpdate pool.ntp.org
apt -y install chrony
timedatectl set-ntp true
systemctl enable chronyd && systemctl restart chronyd
systemctl enable chrony && systemctl restart chrony
timedatectl set-timezone Asia/Jakarta
chronyc sourcestats -v
chronyc tracking -v
mkdir -p /etc/xray
#Get SSL untuk Domain
sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
cd /root/
curl https://get.acme.sh | sh
bash acme.sh --install
cd .acme.sh
bash acme.sh --set-default-ca --server letsencrypt
bash acme.sh --register-account -m ternaklele22@gmail.com
bash acme.sh --issue -d $domain --standalone -k ec-256
bash acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
sleep 3
clear
