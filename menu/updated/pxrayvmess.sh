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
echo -e "$BLUE $NC $BRED            [ Vmess Panel ]      $BLUE"
echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$BLUE -----------------------------------------------"
echo -e "$BLUE ➣$NC [1$NC]. Create Account $BLUE"
echo -e "$BLUE ➣$NC [2$NC]. Trial Account  $BLUE"
echo -e "$BLUE ➣$NC [3$NC]. Delete Account $BLUE"
echo -e "$BLUE ➣$NC [4$NC]. Check User Login $BLUE"
echo -e "$BLUE ➣$NC [5$NC]. Rennew Account $BLUE"
echo -e "$BLUE ➣$NC [6$NC]. Cek Detail Akun $BLUE"
echo -e "$BLUE ➣$NC [7$NC]. Restore Akun $BLUE"
echo -e "$BLUE ➣$NC [8$NC]. Back To Menu $BLUE"
echo -e "$BLUE -----------------------------------------------"
echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
read -p "Select From Options [ 1 - 8 ] : " menu
echo -e ""
case $menu in
1)
addvmess
;;
2)
trialvmess
;;
3)
dellvmess
;;
4)
cekxrayvmess
;;
5)
rennewvmess
;;
6)
cekdetailvmess
;;
7)
addaccountvmess
;;
8)
menu
;;
*)
clear
bash menu
;;
esac
