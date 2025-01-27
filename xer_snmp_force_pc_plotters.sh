#!/bin/bash
ip1=$1
note1=$2
ippl1=$3
note2=$4
#hardcode_alternative
#наколхожена жесткая конструкция, поверх уже существующей внутри функции snmp, поскольку переменные определенные в функции не могут использоваться за ее пределами пришлось еще раз получить имя хоста и "причесать" его с помощью awk, на самом деле можно было обойтись и grep на исключение кавычек
#hostname_prep_crutch=$(snmpget -Oqv -v2c -cpublic $ip1 iso.3.6.1.2.1.43.5.1.1.16.1 |awk '{print substr($0, 2, length($0)-2)}')


#ippl2=$4
#ippl3=$5
#ippl4=$6
snmp(){
#ip1=$1
#ip1=$1 doesnt work! need difine value before function
hostname1=$(snmpget -Oqv -v2c -cpublic $ip1 iso.3.6.1.2.1.43.5.1.1.16.1)
#customname1

#set current value
#cyan+yelow fixed specially for 7030
yc=$(snmpget -Oqv -v2c -cpublic $ip1 iso.3.6.1.2.1.43.11.1.1.9.1.2)
mc=$(snmpget -Oqv -v2c -cpublic $ip1 iso.3.6.1.2.1.43.11.1.1.9.1.3)
cc=$(snmpget -Oqv -v2c -cpublic $ip1 iso.3.6.1.2.1.43.11.1.1.9.1.4)
kc=$(snmpget -Oqv -v2c -cpublic $ip1 iso.3.6.1.2.1.43.11.1.1.9.1.1)
wsc=$(snmpget -Oqv -v2c -cpublic $ip1 iso.3.6.1.2.1.43.11.1.1.9.1.5)
outpaper1=$(snmpget -Oqv -v2c -cXpublic $ippl1 iso.3.6.1.2.1.43.8.2.1.10.1.1)
lowpaper1=$(snmpget -Oqv -v2c -cXpublic $ippl1 iso.3.6.1.2.1.43.8.2.1.11.1.1)
plotteroff=$(snmpget -Oqv -v2c -cXpublic $ippl1 iso.3.6.1.2.1.1.5.0)
#old method
#st=$(snmpget -Oqv -v2c -cpublic $ip1 iso.3.6.1.2.1.43.10.2.1.15.1.1)
st=$(snmpget -Oqv -v2c -cpublic $ip1 iso.3.6.1.2.1.25.3.2.1.5.103)
#paper2=$(snmpget -Oqv -v2c -cXpublic $ippl2 iso.3.6.1.2.1.43.11.1.1.9.1.10)
#paper3=$(snmpget -Oqv -v2c -cXpublic $ippl3 iso.3.6.1.2.1.43.11.1.1.9.1.10)
#paper4=$(snmpget -Oqv -v2c -cXpublic $ippl4 iso.3.6.1.2.1.43.11.1.1.9.1.10)

#bad1#iso.3.6.1.2.1.43.8.2.1.10.1.1 = INTEGER: 0
#ok1#iso.3.6.1.2.1.43.8.2.1.10.1.1 = INTEGER: -3
#bad2#iso.3.6.1.2.1.43.8.2.1.11.1.1 = INTEGER: 8
#ok2#iso.3.6.1.2.1.43.8.2.1.11.1.1 = INTEGER: 0

#set full value
yf=$(snmpget -Oqv -v2c -cpublic $ip1 iso.3.6.1.2.1.43.11.1.1.8.1.2)
mf=$(snmpget -Oqv -v2c -cpublic $ip1 iso.3.6.1.2.1.43.11.1.1.8.1.3)
cf=$(snmpget -Oqv -v2c -cpublic $ip1 iso.3.6.1.2.1.43.11.1.1.8.1.4)
kf=$(snmpget -Oqv -v2c -cpublic $ip1 iso.3.6.1.2.1.43.11.1.1.8.1.1)
wsf=$(snmpget -Oqv -v2c -cpublic $ip1 iso.3.6.1.2.1.43.11.1.1.8.1.5)

#mp - magenta percent
ccp=$(qalc -t 100*$cc/$cf)
mp=$(qalc -t 100*$mc/$mf)
yp=$(qalc -t 100*$yc/$yf)
kp=$(qalc -t 100*$kc/$kf)
#wsp=$(qalc -t 100*$wsc/$wsf)
wsp=$(qalc -t 100*$wsc/$wsf*10000*-1)
#fixed for xerox 7030

#qalc -t = only result
note=$note1

#div2
ccpd2=$(qalc -t $ccp/2)
mpd2=$(qalc -t $mp/2)
ypd2=$(qalc -t $yp/2)
kpd2=$(qalc -t $kp/2)
wsd2=$(qalc -t $wsp/4)

prccpd2=$(printf "%0.s█" $(seq 1 $ccpd2))
prmpd2=$(printf "%0.s█" $(seq 1 $mpd2))
prypd2=$(printf "%0.s█" $(seq 1 $ypd2))
prkpd2=$(printf "%0.s█" $(seq 1 $kpd2))
prwsd2=$(printf "%0.s█" $(seq 1 $wsd2))

#CYAN='\033[0;36m'
#PURP='\033[0;35m'
#YEL='\033[1;33m'
#BLK='\033[0;37m' #grey, orig blk is '\033[0;30m'
#NC='\033[0m' #no color



CYAN='\033[1;36m'
PURP='\033[1;35m'
YEL='\033[1;33m'
BLK='\033[0;37m' #grey, orig blk is '\033[0;30m'
NC='\033[0m' #no color
RED='\033[1;31m'
GREEN='\033[1;32m'
WASTE='\033[3;33m'

#old method
#sleep='2'
#ready='0'
#needs_attention='8'

ready='3'
#needs_attention='5'

#debug #echo $kpd2
#for tmux echo ' '
#for tmux echo ' '
#echo -e "Hostname:     $hostname1" '\e]8;;http://'$ip1'/\e\\'$hostname1'\e]8;;\e\\'
#echo -e "Hostname:      $hostname1" '\e]8;;http://'$ip1'/\e\\Go to web services\e]8;;\e\\'
echo "Hostname:	$hostname1" "$ip1"
echo "Note:		$note"

#old method construction
#if [ "$st" = "$sleep" ]; then
#        echo -e "${GREEN}Status: Sleep${NC}"
#elif [ "$st" = "$ready" ]; then
#        echo -e "${GREEN}Status: Ready${NC}"
#else
#        echo -e "${YEL}Status: Needs Attention${NC}"
#fi


if [ "$st" = "$ready" ]; then
	echo -e "${GREEN}Status: Ready${NC}"
else
	echo -e "${YEL}Status: Needs Attention${NC}"
fi


echo -e "106R03748 Cyan toner:	${CYAN} $prccpd2${NC} $ccp%"
echo -e "106R03747 Magenta toner:${PURP} $prmpd2${NC} $mp%"
echo -e "106R03746 Yellow toner:	${YEL} $prypd2${NC} $yp%"
echo -e "106R03745 Black toner:	${BLK} $prkpd2${NC} $kp%"
echo -e "115R00128 Waste toner:	${WASTE} $prwsd2${NC} $wsp%"
#echo ' '
#echo "Plotter: $note2"
plotterON='"XEROX 6204 WIDE FORMAT"'
paperOK='-3'
paperFULL='0'
#debug#echo "$lowpaper1"

if [ "$plotterON" = "$plotteroff" ]; then
#	echo -e "${GREEN}Plotter: $note2" '\e]8;;http://'$ippl1'/\e\\Go to web services\e]8;;\e\\'
	echo -e "${GREEN}Plotter: $note2" "$ippl1"
else
	echo -e "${RED}Plotter: $note2"
fi



if [ "$paperOK" = "$outpaper1" ]; then
	echo -e "${GREEN}Paper OK${NC}"
else
	echo -e "${RED}Paper EMPTY${NC}"
fi



if [ "$paperFULL" = "$lowpaper1" ]; then
	echo -e "${GREEN}FULL level${NC}"
else
	echo -e "${YEL}LOW level${NC}"
fi

##extention for journaling to file
##get date, time, note, color, percents and push to file
#datetime=$(date +"%Y-%m-%d %H:%M:%S")
##$note1


##echo cyan
#echo -e $datetime >> monPC.jour
#mon_cyan=$(echo -e "Cyan: $prccpd2 $ccp%")
#echo -e $note1 $mon_cyan >> "$note1".jour
##echo magenta
#mon_magenta=$(echo -e "Magenta: $prmpd2 $mp%")
#echo -e $note1 $mon_magenta >> "$note1".jour
##echo yellow
#mon_yellow=$(echo -e "Yellow: $prypd2 $yp%")
#echo -e $note1 $mon_yellow >> "$note1".jour
##echo black
#mon_black=$(echo -e "Black: $prkpd2 $kp%")
#echo -e $note1 $mon_black >> "$note1".jour



}

while true; do
	out="$(snmp)"
	#extention for mon
	datetime=$(date +"%Y-%m-%d %H:%M:%S")
#extention for mon2
#	echo $datetime >> "$hostname_prep_crutch".jour
#	echo "$out" |grep -v ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████ >> "$hostname_prep_crutch".jour
#extention for mon2/
	echo $datetime  >> "$note1".jour
	echo "$out" |grep -v ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████ >> "$note1".jour
	#extention for mon/
	clear
	echo "$out" |grep -v ████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
	sleep 240
done
