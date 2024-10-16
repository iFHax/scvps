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
#information
OK = "$ {
  Green
}[OK]$ {
  Font
}"
Error = "$ {
  Red
}[Mistake]$ {
  Font
}"
clear
echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$BLUE           $ORANGE ✶ Setting Menu ✶ $BLUE   "
echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$BLUE ---------------------------------------"
echo -e "$BLUE ➣$NC [1$NC]. Change Domain               $BLUE"
echo -e "$BLUE ➣$NC [2$NC]. Change Port XRAYS WS/GRPC & HTTP$BLUE" 
echo -e "$BLUE ➣$NC [3$NC]. Cek Bandwith Server         $BLUE"
echo -e "$BLUE ➣$NC [4$NC]. System Backup & Restore     $BLUE"
echo -e "$BLUE ➣$NC [5$NC]. Rennew Cert                 $BLUE" 
echo -e "$BLUE ➣$NC [6$NC]. Reset Log Xray              $BLUE"
echo -e "$BLUE ➣$NC [7$NC]. Setings SSH               $BLUE"
echo -e "$BLUE ➣$NC [8$NC]. DNS Setings               $BLUE"
echo -e "$BLUE ➣$NC [9$NC]. Back to Menu                $BLUE" 
echo -e "$BLUE ---------------------------------------"
echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
read -p "Select From Options [ 1 - 8 ] : " menu
echo -e ""
case $menu in
1)
chngedomain
;;
2)
chngeport
;;
3)
vnstat
;;
4)
mbackup
;;
5)
certxray
;;
6)
resetlog
;;
7)
sshws
;;
8)
setdns
;;
9)
clear
menu
;;
*)
clear
msetting
;;
esac
#