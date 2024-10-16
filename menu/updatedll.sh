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
# =========================================
# Getting
#
cd
# collor status
error1="${RED} [ERROR] ${NC}"
success="${GREEN} [OK] ${NC}"
# Cek Domain
source /var/lib/akbarstorevpn/ipvps.conf
if [[ "$IP" = "" ]]; then
    clear
    echo -e " ${error1}Gagal Install-Update.."
    sleep 2
    exit 0
else
    clear
    echo -e "${success}Installasi Update Menu..."
    sleep 2
fi
# ==========================================
# link hosting kalian
akbarvpn="https://raw.githubusercontent.com/iFHax/scvps/main/backup"
akbarvpnn="https://raw.githubusercontent.com/iFHax/scvps/main/menu/updated"
akbarvpnnn="https://raw.githubusercontent.com/iFHax/scvps/main/updated"
sshmenu="https://raw.githubusercontent.com/iFHax/scvps/main/ssh"
menudns="https://raw.githubusercontent.com/iFHax/scvps/main/dns"
xraymod="https://raw.githubusercontent.com/iFHax/scvps/main/xray"
cd
rm -r updatedll
wget -O updatedll "https://raw.githubusercontent.com/iFHax/scvps/main/menu/updatedll.sh"
rm -rf updatedll

# hapus
cd /usr/bin
rm -rf xmenu
rm -rf updatedll
rm -r updatedll
# download
#
cd /usr/bin
# update by Andi64
wget -O updatedll "https://raw.githubusercontent.com/iFHax/scvps/main/menu/updatedll.sh"
wget -O restart-xray "https://raw.githubusercontent.com/iFHax/scvps/main/menu/restart-xray.sh"
wget -O cek-port "https://raw.githubusercontent.com/iFHax/scvps/main/menu/cek-port.sh"
# Get Backup Menu
wget -O addemail "${akbarvpn}/addemail.sh"
wget -O autobackup "${akbarvpn}/autobackup.sh"
wget -O backup "${akbarvpn}/backup.sh"
wget -O changesend "${akbarvpn}/changesend.sh"
wget -O restore "${akbarvpn}/restore.sh"
wget -O set-br "${akbarvpn}/set-br.sh"
wget -O startbackup "${akbarvpn}/startbackup.sh"
wget -O stopbackup "${akbarvpn}/stopbackup.sh"
wget -O strt "${akbarvpn}/strt.sh"
wget -O testsend "${akbarvpn}/testsend.sh"

# Update menu
wget -O menu "${akbarvpnn}/menu.sh"
wget -O msettings "${akbarvpnn}/msetting.sh"
wget -O start-menu "${akbarvpnn}/start-menu.sh"
wget -O pshadowshock "${akbarvpnn}/pshadowshock.sh"
wget -O ptrojan "${akbarvpnn}/ptrojan.sh"
wget -O pxrayvless "${akbarvpnn}/pxrayvless.sh"
wget -O pxrayvmess "${akbarvpnn}/pxrayvmess.sh"
wget -O mbackup "${akbarvpnn}/mbackup.sh"
wget -O mbandwith "${akbarvpnn}/mbandwith.sh"
wget -O mssh "${akbarvpnn}/mssh.sh"
wget -O msshws "${akbarvpnn}/msshws.sh"
wget -O setdns "${akbarvpnn}/setdns.sh"

# update xray menu
wget -O addvmess "${akbarvpnnn}/addvmess.sh"
wget -O dellvmess "${akbarvpnnn}/dellvmess.sh"
wget -O rennewvmess "${akbarvpnnn}/rennewvmess.sh"
wget -O addvless "${akbarvpnnn}/addvless.sh"
wget -O dellvless "${akbarvpnnn}/dellvless.sh"
wget -O rennewvless "${akbarvpnnn}/rennewvless.sh"
wget -O addtrojan "${akbarvpnnn}/addtrojan.sh"
wget -O delltrojan "${akbarvpnnn}/delltrojan.sh"
wget -O rennewtrojan "${akbarvpnnn}/rennewtrojan.sh"
wget -O addss "${akbarvpnnn}/addss.sh"
wget -O dellss "${akbarvpnnn}/dellss.sh"
wget -O rennewss "${akbarvpnnn}/rennewss.sh"
wget -O adddomain "${akbarvpnnn}/adddomain.sh"
wget -O chngedomain "${akbarvpnnn}/chngedomain.sh"
wget -O chngeport "${akbarvpnnn}/chngeport.sh"
wget -O certxray "${akbarvpnnn}/certxray.sh"
wget -O xp "${akbarvpnnn}/xp.sh"
wget -O cekxraytrojan "${akbarvpnnn}/cekxraytrojan.sh"
wget -O cekxrayvless "${akbarvpnnn}/cekxrayvless.sh"
wget -O cekxrayvmess "${akbarvpnnn}/cekxrayvmess.sh"
wget -O cekdetailvmess "${akbarvpnnn}/cekdetailvmess.sh"
wget -O cekbandwithuser "${akbarvpnnn}/cekbandwithuser.sh"
wget -O cekbandwithvps "${akbarvpnnn}/cekbandwithvps.sh"
wget -O trialvmess "${akbarvpnnn}/trialvmess.sh"
wget -O trialvless "${akbarvpnnn}/trialvless.sh"
wget -O resetlog "${akbarvpnnn}/resetlog.sh"
wget -O cekdetailss "${akbarvpnnn}/cekdetailss.sh"
wget -O addaccountvmess "${akbarvpnnn}/addaccountvmess.sh"

#SSH CDN Menu
wget -O usernew "${sshmenu}/usernew.sh"
wget -O trial "${sshmenu}/trial.sh"
wget -O renew "${sshmenu}/renew.sh"
wget -O hapus "${sshmenu}/hapus.sh"
wget -O cek "${sshmenu}/cek.sh"
wget -O member "${sshmenu}/member.sh"
wget -O delete "${sshmenu}/delete.sh"
wget -O autokill "${sshmenu}/autokill.sh"
wget -O ceklim "${sshmenu}/ceklim.sh"
wget -O tendang "${sshmenu}/tendang.sh"
wget -O user-lock "${sshmenu}/user-lock.sh"
wget -O user-unlock "${sshmenu}/user-unlock.sh"
wget -O sshws "${sshmenu}/sshws.sh"
wget -O statussshws "${sshmenu}/status.sh"

#Menu DNS
wget -O google "${menudns}/google.sh"
wget -O cisco "${menudns}/cisco.sh"
wget -O adguard "${menudns}/adguard.sh"
wget -O quad9 "${menudns}/quad9.sh"
wget -O statusdns "${menudns}/statusdns.sh"

#Xray Mod
wget -O xraymod "${menudns}/xraymod.sh"

#
chmod +x /usr/bin/updatedll
chmod +x updatedll
chmod +x restart-xray
chmod +x cek-port

# update menu
chmod +x msettings
chmod +x mbandwith
chmod +x start-menu
chmod +x menu
chmod +x pshadowshock
chmod +x ptrojan
chmod +x pxrayvless
chmod +x pxrayvmess
chmod +x mbackup
chmod +x mssh
chmod +x sshws
chmod +x setdns

# update xray menu
chmod +x addvmess
chmod +x dellvmess
chmod +x rennewvmess
chmod +x addvless
chmod +x dellvless
chmod +x rennewvless
chmod +x addtrojan
chmod +x delltrojan
chmod +x rennewtrojan
chmod +x addss
chmod +x dellss
chmod +x rennewss
chmod +x certxray
chmod +x adddomain
chmod +x chngedomain
chmod +x chngeport
chmod +x xp
chmod +x cekxraytrojan
chmod +x cekxrayvless
chmod +x cekxrayvmess
chmod +x cekdetailvmess
chmod +x cekbandwithuser
chmod +x cekbandwithvps
chmod +x trialvmess
chmod +x trialvless
chmod +x resetlog
chmod +x cekdetailss
chmod +x addaccountvmess

#Menu SSH
chmod +x usernew
chmod +x trial
chmod +x renew
chmod +x hapus
chmod +x cek
chmod +x member
chmod +x delete
chmod +x autokill
chmod +x ceklim
chmod +x tendang
chmod +x up
chmod +x user-lock
chmod +x user-unlock
chmod +x statussshws
chmod +x msshws

# Update Backup
chmod +x addemail
chmod +x autobackup
chmod +x backup
chmod +x changesend
chmod +x limitspeed
chmod +x restore
chmod +x set-br
chmod +x startbackup
chmod +x stopbackup
chmod +x strt
chmod +x testsend

# DNS Menu
chmod +x google
chmod +x cisco
chmod +x adguard
chmod +x quad9
chmod +x statusdns

#xray MOD
chmod +x xraymod

clear
echo -e "Update Selesai..."
cd
