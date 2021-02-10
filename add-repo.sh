#!/bin/bash
#UwUwUwUwUwUwUwU
red='\033[1;31m'
rset='\033[0m'
grn='\033[1;32m'
ylo='\033[1;33m'
blue='\033[1;34m'
cyan='\033[1;36m'
pink='\033[1;35m'
#UwUwUwUwUwUwUwU
list="$PREFIX/etc/apt/sources.list.d/pero-repo.list"

#Pero-Repo Installation

check=$(uname -o)
if [ $check == "Android" ]; then
echo -e $red [!] OS : $check $rset
echo -e $cyan [+] Beggining Installation Of Pero-Repo $rset
sleep 2
else
echo -e $red "[!] Use This Repo in Termux Only" $rset
fi

#requirements
echo -e $grn [+] Installing Requirements.... $rset
apt install gnupg -y &>/dev/null
echo -e $grn [OK] GNUPG Installed $rset
#KEY
sleep 1
echo -e $grn [+] Adding KEY $rset
sleep 1
curl -L --fail --retry 5 -O https://exterminator777.github.io/pero-repo/KEY.gpg &>/dev/null
apt-key add KEY.gpg
rm -rf KEY.gpg

if [ -f "$list" ];then
echo -e $grn [OK] Repo Already Exists!!
else
echo $grn [+] DONE
fi

#Final
echo -e $grn "[*] Finalizing..." $rset
echo "deb https://exterminator777.github.io/pero-repo ./" > $list
sleep 2

#update
echo -e $grn Running apt update...
apt update
sleep 0.50
