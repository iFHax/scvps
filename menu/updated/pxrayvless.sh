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
BRED="\e[41m"
# ==========================================
#information
OK="${GREEN}[OK]${NC}"
Error="${RED}[Mistake]${NC}"
clear
echo -e ""
echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$BLUE $NC $BRED             [ Vless Panel ]       $BLUE"
echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$BLUE ---------------------------------------"
echo -e "$BLUE ➣$NC [1$NC]. Create Account XRAYS Vless $BLUE"
echo -e "$BLUE ➣$NC [2$NC]. Trial Account XRAYS Vless  $BLUE"
echo -e "$BLUE ➣$NC [3$NC]. Delete Account XRAYS Vless $BLUE"
echo -e "$BLUE ➣$NC [4$NC]. Check User Login           $BLUE"
echo -e "$BLUE ➣$NC [5$NC]. Rennew Account XRAYS Vless $BLUE"
echo -e "$BLUE ➣$NC [6$NC]. Back To Menu               $BLUE"
echo -e "$BLUE --------------------------------------- "
echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC" 
read -p "Select From Options [ 1 - 6 ] : " menu
echo -e ""
case $menu in
1)
addvless
;;
2)
trialvless
;;
3)
delless
;;
4)
cekxrayvless
;;
5)
rennewvless
;;
6)
menu
;;
*)
clear
bash menu
;;
esac
