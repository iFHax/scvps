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
echo -e "$BLUE           $ORANGE ✶ DNS SETINGS ✶ $BLUE   "
echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$BLUE ---------------------------------------"
echo -e "$BLUE ➣$NC [1$NC]. DNS GOOGLE               $BLUE"
echo -e "$BLUE ➣$NC [2$NC]. DNS CISCO $BLUE"
echo -e "$BLUE ➣$NC [3$NC]. DNS ADGUARD $BLUE"
echo -e "$BLUE ➣$NC [4$NC]. DNS QUAD9 $BLUE"
echo -e "$BLUE ➣$NC [5$NC]. STATUS DNS $BLUE"
echo -e "$BLUE ➣$NC [6$NC]. Back $BLUE"
echo -e "$BLUE ---------------------------------------"
echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
case $menu in
1)
google
;;
2)
cisco
;;
3)
adguard
;;
4)
quad9
;;
5)
statusdns
;;
6)
msetting
;;
*)
    menu
    ;;
esac