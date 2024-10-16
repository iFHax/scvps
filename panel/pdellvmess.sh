read -rp "Username : " -e user1
user=$(grep -E "^### $user1" "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2)
exp=$(grep -E "^### $user" "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 3)
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
rm -f /etc/xray/vmess-$user-tls.json /etc/xray/vmess-$user-nontls.json /etc/xray/vmess-$user-grpc.json
clear
echo "==============================="
echo "  XRAYS/Vmess Account Tester  "
echo "==============================="
echo "Username  : $user"
echo "Expired   : $exp"
echo "==============================="
echo "Script Mod By andi64"