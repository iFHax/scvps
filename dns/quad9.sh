NC='\e[0m'
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'
clear
echo -e " "
echo -e "${YB}Setup Quad9 DNS${NC}"
cat > /etc/systemd/resolved.conf << END
[Resolve]
DNS=9.9.9.9 149.112.112.112
Domains=~.
ReadEtcHosts=yes
END
systemctl restart resolvconf
systemctl restart systemd-resolved
systemctl restart NetworkManager
echo "Quad9 DNS" > /user/current
echo -e "${YB}Setup Completed${NC}"