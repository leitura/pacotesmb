#!/bin/bash
echo "#!/bin/bash
if [ "'$1'" == start ]
then
badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000 --max-connections-for-client 10 > /dev/null &
echo 'Badvpn rodando na porta 7300'
fi
if [ "'$1'" == stop ]
then
badvpnpid="'$(ps x |grep badvpn |grep -v grep |awk '"{'"'print $1'"'})
kill -9 "'"$badvpnpid" >/dev/null 2>/dev/null
kill $badvpnpid > /dev/null 2> /dev/null
kill "$badvpnpid" > /dev/null 2>/dev/null''
kill $(ps x |grep badvpn |grep -v grep |awk '"{'"'print $1'"'})
killall badvpn-udpgw
fi" > /bin/badvpn
chmod +x /bin/badvpn
if [ -f /bin/badvpn-udpgw ]; then
echo -e "\033[1;32m Badvpn já está instalado\033[0m"
rm -rf $HOME/badudp.sh > /dev/null 2>&1
exit
else
clear
fi
echo -e "\033[1;31m           Instalador Badvpn\n\033[0m"
echo -e "Baixando Badvpn"
wget -O /bin/badvpn-udpgw https://raw.githubusercontent.com/leitura/ospacotesmb/main/badvpn-udpgw -o /dev/null
chmod +x /bin/badvpn-udpgw
clear
echo -e "\033[1;32m             Instalação completa\033[0m" 
echo -e "\033[1;37mComandos:\n\033[1;31mbadvpn start\033[1;37m para iniciar o badvpn"
echo -e "\033[1;31mbadvpn stop \033[1;37m para parar o badvpn\033[0m"
rm -rf $HOME/badudp.sh > /dev/null 2>&1