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
#menu
clear
echo -e ""
echo -e "$BLUE╔═══════════════════════════════════════$BLUE╗"
echo -e "$BLUE║$NC $BRED             [ Cek Bandwith ]         $BLUE   ║"
echo -e "$BLUE╠═══════════════════════════════════════$BLUE╣"
echo -e "$BLUE║---------------------------------------║"
echo -e "$BLUE╠➣$NC 1$NC. Cek Bandwith Per User    $BLUE      ║ "
echo -e "$BLUE╠➣$NC 2$NC. Cek Bandwith VPS    $BLUE      ║ "
echo -e "$BLUE╠➣$NC 3$NC. Menu        $BLUE      ║ "
echo -e "$BLUE║---------------------------------------║"
echo -e "$BLUE╚═══════════════════════════════════════╝$NC"
read -p "Select From Options [ 1 - 3 ] : " menu
echo -e ""
case $menu in
1)
cekbandwithuser
;;
2)
cekbandwithvps
;;
3)
menu
;;
*)
esac