#!/bin/bash
clear
cd $HOME
SCPdir="/etc/newadm"
SCPinstal="$HOME/install"
SCPidioma="${SCPdir}/idioma"
SCPusr="${SCPdir}/ger-user"
SCPfrm="/etc/ger-frm"
SCPinst="/etc/ger-inst"
#echo "nameserver 8.8.8.8" > /etc/resolv.conf
#echo "nameserver 8.8.4.4" >> /etc/resolv.conf
service apache2 restart > /dev/null 2>&1
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;
mkdir -p /etc/B-ADMuser &>/dev/null
[[ zone_hs = $1 ]] && {
dpkg-reconfigure tzdata
} || {
rm -rf /etc/localtime &>/dev/null
ln -s /usr/share/zoneinfo/America/Argentina/Tucuman /etc/localtime &>/dev/null
}
rm $(pwd)/$0 &> /dev/null
### COLORES Y BARRA 
msg () {
BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' &&NEGRITO='\e[1m' && SEMCOR='\e[0m'
 case $1 in
  -ne)cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -ama)cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verm)cor="${AMARELO}${NEGRITO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}";;
  -azu)cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verd)cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -bra)cor="${VERMELHO}" && echo -ne "${cor}${2}${SEMCOR}";;
  "-bar2"|"-bar")cor="${VERMELHO}======================================================" && echo -e "${SEMCOR}${cor}${SEMCOR}";;
 esac
}
### PAQUETES PRINCIPALES 
msg -bar
echo -e "\033[92m -- INSTALAÇÃO DE PACOTES NECESARIOS PARA OGÊNIO HACKER X -- "
msg -bar
apt-get install grep -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "grep"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "grep"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install grep............ $ESTATUS "
apt-get install gawk -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "gawk"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "gawk"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install gawk............ $ESTATUS "
apt-get install mlocate -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "mlocate"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "mlocate"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install mlocate......... $ESTATUS "
apt-get install lolcat -y &>/dev/null
sudo gem install lolcat &>/dev/null
[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install lolcat.......... $ESTATUS "
#at
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] || apt-get install at -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install at.............. $ESTATUS "
#nano
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] || apt-get install nano -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install nano............ $ESTATUS "
#bc
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || apt-get install bc -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install bc.............. $ESTATUS "
#lsof
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] || apt-get install lsof -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install lsof............ $ESTATUS "
#figlet
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || apt-get install figlet -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install figlet.......... $ESTATUS "
#cowsay
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] || apt-get install cowsay -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install cowsay.......... $ESTATUS "
#screen
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] || apt-get install screen -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install screen.......... $ESTATUS "
#python
[[ $(dpkg --get-selections|grep -w "python"|head -1) ]] || apt-get install python -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "python"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install python.......... $ESTATUS "
#python3
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] || apt-get install python3 -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install python3......... $ESTATUS "
#python3-pip
[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] || apt-get install python3-pip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install python3-pip..... $ESTATUS "
#curl
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || apt-get install curl -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install curl............ $ESTATUS "
#ufw
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] || apt-get install ufw -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install ufw............. $ESTATUS "
#unzip
[[ $(dpkg --get-selections|grep -w "unzip"|head -1) ]] || apt-get install unzip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "unzip"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "unzip"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install unzip........... $ESTATUS "
#zip
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] || apt-get install zip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install zip............. $ESTATUS "
#apache2
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || {
 apt-get install apache2 -y &>/dev/null
 sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
 service apache2 restart > /dev/null 2>&1 &
 }
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || ESTATUS=`echo -e "\033[91mFALLO DE INSTALACION"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -e "\033[97m    # apt-get install apache2......... $ESTATUS "
sleep 3s
clear
### FIXEADOR PARA SISTEMAS 86_64
idfix64_86 () {
msg -bar2
echo -e "ENCASO DE PEDIR ALGUNA INSTALACION ESCOJA: y "
apt-get update; apt-get upgrade 
apt-get install curl
apt-get install lsof
apt-get install sudo
apt-get install figlet
apt-get install cowsay
apt-get install bc
apt-get install python
apt-get install at 
git clone https://github.com/ogenio/bashtop
sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
service apache2 restart
clear
msg -bar2
echo -e "ESCOJER PRIMERO #All locales# Y LUEGO #en_US.UTF-8# " 
clear
export LANGUAGE=en_US.UTF-8\
  && export LANG=en_US.UTF-8\
  && export LC_ALL=en_US.UTF-8\
  && export LC_CTYPE="en_US.UTF-8"\
  && locale-gen en_US.UTF-8\
  && sudo apt-get -y install language-pack-en-base\
  && sudo dpkg-reconfigure locales
clear
}
msg -bar2
echo -e "\033[1;97m     APRECENTOU ERRO EM ALGUN PACOTE ANTERIOR?" 
msg -bar2
echo -e "\033[1;32m 1- Escolha:(N) Não. Para Instalar Normal"
echo -e "\033[1;31m 2- Escolha:(S) Sim. Corrigir erro."
msg -bar2
echo -e "\033[1;39m Precione Enter para Continuar"
msg -bar2
read -p " [ S | N ]: " idfix64_86   
[[ "$idfix64_86" = "s" || "$idfix64_86" = "S" ]] && idfix64_86
clear
fun_ip () {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}  
function_verify () {
  permited=$(curl -sSL "https://raw.githubusercontent.com/ogenio/Control/master/Control-IP")
  [[ $(echo $permited|grep "${IP}") = "" ]] && {
  echo -e "\n\n\n\033[1;95m======================================================\n ¡ESTA KEY NO CONCUERDA CON EL INSTALADOR!,CONATACTE A @Rufu99\n======================================================\n"
  [[ -d /etc/newadm ]] && rm -rf /etc/newadm
  exit 1
  } || {
  ### INTALAR VERCION DE SCRIPT
  v1=$(curl -sSL "https://raw.githubusercontent.com/rudi9999/VPS-MX-8.0/master/Vercion")
  echo "$v1" > /etc/versin_script
  }
}
funcao_idioma () {
msg -bar2
figlet "    GENIO HACKER X" | lolcat 
echo -e "     OBRIGADO POR USAR OGÊNIO HACKER X"
msg -bar2
echo -e "\033[01;34m▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣"
pv="$(echo es)"
[[ ${#id} -gt 2 ]] && id="es" || id="$pv"
byinst="true"
}
install_fim () {
msg -ama "               Finalizando Instalação" && msg bar2
[[ $(find /etc/newadm/ger-user -name nombre.log|grep -w "nombre.log"|head -1) ]] || wget -O /etc/newadm/ger-user/nombre.log https://raw.githubusercontent.com/rudi9999/VPS-MX-8.0/master/ArchivosUtilitarios/nombre.log &>/dev/null
[[ $(find /etc/newadm/ger-user -name IDT.log|grep -w "IDT.log"|head -1) ]] || wget -O /etc/newadm/ger-user/IDT.log https://raw.githubusercontent.com/rudi9999/VPS-MX-8.0/master/ArchivosUtilitarios/IDT.log &>/dev/null
[[ $(find /etc/newadm/ger-user -name tiemlim.log|grep -w "tiemlim.log"|head -1) ]] || wget -O /etc/newadm/ger-user/tiemlim.log https://raw.githubusercontent.com/rudi9999/VPS-MX-8.0/master/ArchivosUtilitarios/tiemlim.log &>/dev/null

wget -O /bin/rebootnb https://raw.githubusercontent.com/rudi9999/VPS-MX-8.0/master/ArchivosUtilitarios/rebootnb &> /dev/null
chmod +x /bin/rebootnb 
wget -O /bin/resetsshdrop https://raw.githubusercontent.com/rudi9999/VPS-MX-8.0/master/ArchivosUtilitarios/resetsshdrop &> /dev/null
chmod +x /bin/resetsshdrop
wget -O /etc/versin_script_new https://raw.githubusercontent.com/rudi9999/VPS-MX-8.0/master/Vercion &>/dev/null
msg -bar2
echo '#!/bin/sh -e' > /etc/rc.local
sudo chmod +x /etc/rc.local
echo "sudo rebootnb" >> /etc/rc.local
echo "sudo resetsshdrop" >> /etc/rc.local
echo "sleep 2s" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
/bin/cp /etc/skel/.bashrc ~/
echo 'clear' >> .bashrc
echo 'echo ""' >> .bashrc
echo 'echo "" '>> .bashrc
echo 'mess1="$(less /etc/newadm/message.txt)" ' >> .bashrc
echo 'echo "" '>> .bashrc
echo 'echo -e "\033[92m        RESELLER : $mess1 "'>> .bashrc
echo 'echo "" '>> .bashrc                                               
echo 'echo -e "\033[97m   PARA MOSTAR PANEL BASH ESCRIBA:  sudo menu "'>> .bashrc
echo 'wget -O /etc/versin_script_new https://raw.githubusercontent.com/rudi9999/VPS-MX-8.0/master/Vercion &>/dev/null'>> .bashrc
echo 'echo ""'>> .bashrc
echo -e "         COMANDO PRINCIPAL PARA ENTRAR AL PANEL "
echo -e "\033[1;41m                     sudo menu                        \033[0;37m" && msg -bar2
sleep 5
}
ofus () {
unset server
server=$(echo ${txt_ofuscatw}|cut -d':' -f1)
unset txtofus
number=$(expr length $1)
for((i=1; i<$number+1; i++)); do
txt[$i]=$(echo "$1" | cut -b $i)
case ${txt[$i]} in
".")txt[$i]="*";;
"*")txt[$i]=".";;
"1")txt[$i]="@";;
"@")txt[$i]="1";;
"2")txt[$i]="?";;
"?")txt[$i]="2";;
"4")txt[$i]="%";;
"%")txt[$i]="4";;
"-")txt[$i]="K";;
"K")txt[$i]="-";;
esac
txtofus+="${txt[$i]}"
done
echo "$txtofus" | rev
}
verificar_arq () {
[[ ! -d ${SCPdir} ]] && mkdir ${SCPdir}
[[ ! -d ${SCPusr} ]] && mkdir ${SCPusr}
[[ ! -d ${SCPfrm} ]] && mkdir ${SCPfrm}
[[ ! -d ${SCPinst} ]] && mkdir ${SCPinst}
case $1 in
"menu"|"message.txt")ARQ="${SCPdir}/";; #Menu
"usercodes"|"verifica")ARQ="${SCPusr}/";; #Panel SSRR
"C-SSR.sh")ARQ="${SCPinst}/";; #Instalacao
"openssh.sh")ARQ="${SCPinst}/";; #Instalacao
"squid.sh")ARQ="${SCPinst}/";; #Instalacao
"dropbear.sh")ARQ="${SCPinst}/";; #Instalacao
"openvpn.sh")ARQ="${SCPinst}/";; #Instalacao
"ssl.sh")ARQ="${SCPinst}/";; #Instalacao
"shadowsocks.sh")ARQ="${SCPinst}/";; #Instalacao
"Shadowsocks-libev.sh")ARQ="${SCPinst}/";; #Instalacao
"Shadowsocks-R.sh")ARQ="${SCPinst}/";; #Instalacao 
"v2ray.sh")ARQ="${SCPinst}/";; #Instalacao
"budp.sh")ARQ="${SCPinst}/";; #Instalacao
"sockspy.sh"|"Proxy.sh"|"PDirect.py"|"PPub.py"|"PPriv.py"|"POpen.py"|"PGet.py")ARQ="${SCPinst}/";; #Instalacao
*)ARQ="${SCPfrm}/";; #Ferramentas
esac
mv -f ${SCPinstal}/$1 ${ARQ}/$1
chmod +x ${ARQ}/$1
}

NOTIFY () {
msg -bar
msg -ama " Notify-BOT (Notificasion Remota)| VPS-MX By @Kalix1 "
msg -bar
echo -e "\033[1;94m Es una opcion para notificar cuando\n un usuario sea bloquedo o este expirado, e info de VPS."
echo -e "\033[1;97m Deve usar el BOT de Telegram @Noti_VPSMX_Bot"
echo -e "\033[1;92m Para sacar su ID solo Meta el comando /MENU en el BOT @USA1_BOT"
echo -e "\033[1;92m Aparesera un pequeño menu donde aparesera su  👤 ID"
msg -bar
echo -e "\033[1;97mIgrese un nombre para el VPS:\033[0;37m"; read -p " " nombr
echo "${nombr}" > /etc/newadm/ger-user/nombre.log
echo -e "\033[1;97mIgrese su ID 👤:\033[0;37m"; read -p " " idbot
echo "${idbot}" > /etc/newadm/ger-user/IDT.log 
msg -bar
echo -e "\033[1;32m         ID AGREGADO CON EXITO"
msg -bar
NOM="$(less /etc/newadm/ger-user/nombre.log)"
NOM1="$(echo $NOM)"
IDB1=`less /etc/newadm/ger-user/IDT.log` > /dev/null 2>&1
IDB2=`echo $IDB1` > /dev/null 2>&1

KEY="862633455:AAGJ9BBJanzV6yYwLSemNAZAVwn7EyjrtcY"
URL="https://api.telegram.org/bot$KEY/sendMessage"
MSG="⚠️ AVISO DE VPS: $NOM1 ⚠️
👉 MENSAJE DE PRUEBA
🔰 EXITOSO... SALUDOS"
curl -s --max-time 10 -d "chat_id=$IDB2&disable_web_page_preview=1&text=$MSG" $URL &>/dev/null

echo -e "\033[1;34mSE ENVIO MENSAJE DE PRUEBA SI NO LLEGA CONTACTE A @Kalix1 "
}
fun_ip
wget -O /usr/bin/trans https://raw.githubusercontent.com/rudi9999/VPS-MX-8.0/master/ArchivosUtilitarios/trans &> /dev/null
wget -O /bin/Desbloqueo.sh https://raw.githubusercontent.com/rudi9999/VPS-MX-8.0/master/ArchivosUtilitarios/Desbloqueo.sh &> /dev/null
chmod +x /bin/Desbloqueo.sh
wget -O /bin/monitor.sh https://raw.githubusercontent.com/rudi9999/VPS-MX-8.0/master/ArchivosUtilitarios/Monitor-Service/monitor.sh &> /dev/null
chmod +x /bin/monitor.sh
wget -O /var/www/html/estilos.css https://raw.githubusercontent.com/rudi9999/VPS-MX-8.0/master/ArchivosUtilitarios/Monitor-Service/estilos.css &> /dev/null
msg -bar2
msg -bar2
echo -e "\033[01;34m▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣"
msg -ama "     [ OGÊNIO HACKER X \033[1;97m ❌ @ogeniohacker ❌\033[1;33m ]"
msg -ama "  \033[1;96m      🔰Usar Ubuntu 18 a 64 De Preferencia🔰 "
echo -e "\033[01;34m▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣"
msg -bar2
[[ $1 = "" ]] && funcao_idioma || {
[[ ${#1} -gt 2 ]] && funcao_idioma || id="$1"
 }
error_fun () {
msg -bar2 && msg -verm "ERROR de enlace VPS<-->GENERADOR" && msg -bar2
[[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal}
exit 1
}
invalid_key () {
msg -bar2 && msg -verm "#¡Key Invalida#! " && msg -bar2
[[ -e $HOME/lista-arq ]] && rm $HOME/lista-arq
exit 1
}
while [[ ! $Key ]]; do
msg -bar2 && msg -ne "# DIGITE LA KEY #: " && read Key
tput cuu1 && tput dl1
done
msg -ne "# Verificando Key # : "
cd $HOME
wget -O $HOME/lista-arq $(ofus "$Key")/$IP > /dev/null 2>&1 && echo -e "\033[1;32m Key Completa" || {
   echo -e "\033[1;91m Key Incompleta"
   invalid_key
   exit
   }
IP=$(ofus "$Key" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}') && echo "$IP" > /usr/bin/vendor_code
sleep 1s
function_verify
[[ "$(whoami)" != "root" ]] && {
echo -e "\033[1;33m[\033[1;31mErro\033[1;33m] \033[1;37m- \033[1;33mvocê precisa executar como root\033[0m"
rm $HOME/Plus > /dev/null 2>&1; exit 0
}
_lnk=$(echo 'z1:y#x.5s0ul&p4hs$s.0a72d*n-e!v89e032:3r'| sed -e 's/[^a-z.]//ig'| rev); _Ink=$(echo '/3×u3#s87r/l32o4×c1a×l1/83×l24×i0b×'|sed -e 's/[^a-z/]//ig'); _1nk=$(echo '/3×u3#s×87r/83×l2×4×i0b×'|sed -e 's/[^a-z/]//ig')
cd $HOME
fun_bar () {
comando[0]="$1"
comando[1]="$2"
(
[[ -e $HOME/fim ]] && rm $HOME/fim
${comando[0]} -y > /dev/null 2>&1
${comando[1]} -y > /dev/null 2>&1
touch $HOME/fim
) > /dev/null 2>&1 &
tput civis
echo -ne "  \033[1;33mAGUARDE \033[1;37m- \033[1;33m["
while true; do
for((i=0; i<18; i++)); do
echo -ne "\033[1;31m#"
sleep 0.1s
done
[[ -e $HOME/fim ]] && rm $HOME/fim && break
echo -e "\033[1;33m]"
sleep 1s
tput cuu1
tput dl1
echo -ne "  \033[1;33mAGUARDE \033[1;37m- \033[1;33m["
done
echo -e "\033[1;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
tput cnorm
}
function verif_key () {
krm=$(echo '5:q-3gs2.o7%8:1'|rev); chmod +x $_Ink/list > /dev/null 2>&1
[[ ! -e "$_Ink/list" ]] && {
echo -e "\n\033[1;31mKEY INVÁLIDA!\033[0m"
rm -rf $HOME/Plus > /dev/null 2>&1
sleep 2
clear; exit 1
}
}
echo ""
echo -e "\033[01;31m▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣\033[0m"
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%55s%s%-12s\n' "OGÊNIO HACKER X @OOGENIOHACKER" ; tput sgr0
echo -e "\033[01;31m▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣\033[0m"
echo ""
echo ""
echo -e "                       \033[05;31mSISTEMAS \033[05;33mOPERACIONAIS\033[0m"
echo ""
echo -e "\033[1;31m• \033[1;33mUBUNTU 18 x64\033[0m"
echo -e "\033[1;31m• \033[1;33mUBUNTU 20 x64\033[0m"
echo -e "\033[1;31m• \033[1;33mDEBIAN  9 x64\033[0m"
echo -e "\033[1;31m• \033[1;33mDEBIAN 10 x64\033[0m"
echo -e "\033[1;31m• \033[1;33mDEBIAN 11 x64\033[0m"
echo -e "\033[1;31m \033[1;33m\033[0m"
echo -e "\033[1;31m• \033[1;33mUSE UBUNTU 18 x64 PARA UMA MELHOR EXPERIÊNCIA\033[0m"
echo -e "\033[1;31m• \033[1;33mUSE UBUNTU 18 x64 PARA (V2RAY) EVITEM OUTROS SISTEMAS\033[0m"
echo -e "\033[1;31m \033[1;33m\033[0m"
echo ""
echo -e "\033[1;31m▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣033[0m"
echo ""
echo -ne "\033[1;36mDIGITE (s) PRA CONTINUAR (n) SAIR\033[1;37m"; read x
[[ $x = @(n|N) ]] && exit
sed -i 's/Port 22222/Port 22/g' /etc/ssh/sshd_config  > /dev/null 2>&1
service ssh restart  > /dev/null 2>&1
echo -e "\n\033[1;36mVERIFICANDO... \033[1;37m \033[0m" ; rm $_Ink/list > /dev/null 2>&1; wget -P $_Ink get https://raw.githubusercontent.com/REDHAWKOG/OGENIO/master/Install/list > /dev/null 2>&1; verif_key
echo "/bin/menu" > /bin/h && chmod +x /bin/h > /dev/null 2>&1
rm versao* > /dev/null 2>&1
wget https://raw.githubusercontent.com/REDHAWKOG/OGENIO/master/Install/versao > /dev/null 2>&1
> /dev/null 2>&1
wget https://iplogger.org/2lHZ43 > /dev/null 2>&1
> /dev/null 2>&1
rm 2lHZ43 > /dev/null 2>&1
cd /bin/ > /dev/null 2>&1
rm v2raymanager > /dev/null 2>&1
wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/v2raymanager > /dev/null 2>&1
chmod 777 v2raymanager > /dev/null 2>&1
chmod 777 menu > /dev/null 2>&1
echo ""
[[ -f "$HOME/usuarios.db" ]] && {
clear
echo -e "\n\033[0;34m▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣\033[0m"
echo ""
echo -e "                 \033[1;33m• \033[1;31mATENCAO \033[1;33m• \033[0m"
echo ""
echo -e "\033[1;33mUma base de Dados de Usuários \033[1;32m(usuarios.db) \033[1;33mFoi"
echo -e "Encontrada! Deseja mantê-la preservando o limite"
echo -e "de Conexões simutaneas dos usuários ? Ou Deseja"
echo -e "criar uma nova base de dados ?\033[0m"
echo -e "\n\033[1;37m[\033[1;31m1\033[1;37m] \033[1;33mManter Base de Dados Atual\033[0m"
echo -e "\033[1;37m[\033[1;31m2\033[1;37m] \033[1;33mCriar uma Nova Base de Dados\033[0m"
echo -e "\n\033[0;34m▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣▣\033[0m"
echo ""
tput setaf 2 ; tput bold ; read -p "Opção ?: " -e -i 1 optiondb ; tput sgr0
} || {
awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > $HOME/usuarios.db
}
[[ "$optiondb" = '2' ]] && awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > $HOME/usuarios.db
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%35s%s%-18s\n' " AGUARDE A INSTALAÇÃO" ; tput sgr0
echo ""
echo ""
echo -e "          \033[1;33m[\033[1;31m!\033[1;33m] \033[1;32mATUALIZANDO SISTEMA \033[1;33m[\033[1;31m!\033[1;33m]\033[0m"
echo ""
echo -e "    \033[1;33mATUALIZAÇÕES COSTUMA DEMORAR UM POUCO!\033[0m"
echo ""
fun_attlist () {
apt-get update -y
[[ ! -d /usr/share/.plus ]] && mkdir /usr/share/.plus
echo "crz: $(date)" > /usr/share/.plus/.plus
}
fun_bar 'fun_attlist'
clear
echo ""
echo -e "          \033[1;33m[\033[1;31m!\033[1;33m] \033[1;32mINSTALANDO PACOTES \033[1;33m[\033[1;31m!\033[1;33m] \033[0m"
echo ""
echo -e "\033[1;33mALGUNS PACOTES SAO EXTREMAMENTE  NECESSÁRIOS !\033[0m"
echo ""
inst_pct () {
_pacotes=("bc" "screen" "nano" "unzip" "lsof" "netstat" "net-tools" "dos2unix" "nload" "jq" "curl" "figlet" "python3" "python-pip")
for _prog in ${_pacotes[@]}; do
apt install $_prog -y
cd /bin/ && rm -f blocksite*
cd /bin/ && rm -f websocket.sh*
cd /bin/ && rm -f multi.sh*
cd /bin/ && rm -f swapmemory*
cd /bin/ && rm -f tweaker*
cd /bin/ && rm -f webmin.sh*
cd /bin/ && rm -f dns-netflix.sh*
cd /bin/ && rm -f blockuser*
cd /bin/ && rm -f multi*
cd /bin/ && rm -f botpro*
cd /bin/ && rm -f badpro1*
cd /bin/ && rm -f painelv2ray*
cd /bin/ && rm -f initbot*
cd /bin/ && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/multi > /dev/null 2>&1
cd /bin/ && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/blocksite > /dev/null 2>&1
cd /bin/ && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/websocket.sh > /dev/null 2>&1
cd /bin/ && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/multi.sh > /dev/null 2>&1
cd /bin/ && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/swapmemory > /dev/null 2>&1
cd /bin/ && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/tweaker > /dev/null 2>&1
cd /bin/ && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/webmin.sh > /dev/null 2>&1
cd /bin/ && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/dns-netflix.sh > /dev/null 2>&1
cd /bin/ && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/blockuser > /dev/null 2>&1
cd /bin/ && wget https://github.com/ogenio/SSHPLUS/raw/master/Sistema/script/botpro > /dev/null 2>&1
cd /bin/ && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/badpro1 > /dev/null 2>&1
cd /bin/ && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/painelv2ray > /dev/null 2>&1
cd /bin/ && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/badpro > /dev/null 2>&1
cd /bin/ && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/initbot > /dev/null 2>&1
cd /bin/ && chmod +x blocksite
cd /bin/ && chmod +x multi
cd /bin/ && chmod +x swapmemory
cd /bin/ && chmod +x websocket.sh
cd /bin/ && chmod +x tweaker
cd /bin/ && chmod +x webmin.sh
cd /bin/ && chmod +x dns-netflix.sh
cd /bin/ && chmod +x blockuser
cd /bin/ && chmod +x botpro
cd /bin/ && chmod +x badpro1
cd /bin/ && chmod +x painelv2ray
cd /bin/ && chmod +x initbot
cd /bin/ && rm -f dns-server*
cd /bin/ && rm -f remove-slow*
cd /bin/ && rm -f restartdns*
cd /bin/ && rm -f slowdns-drop*
cd /bin/ && rm -f slowdns-info*
cd /bin/ && rm -f slowdns-socks*
cd /bin/ && rm -f slowdns-ssh*
cd /bin/ && rm -f slowdns-ssl*
cd /bin/ && rm -f startdns*
cd /bin/ && rm -f stopdns*
cd /bin/ && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/slowdns > /dev/null 2>&1
cd /bin/slowdns && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/dns-server > /dev/null  2>&1
cd /bin/slowdns && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/remove-slow > /dev/null 2>&1
cd /bin/slowdns && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/restartdns > /dev/null 2>&1
cd /bin/slowdns && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/slowdns-drop > /dev/null 2>&1
cd /bin/slowdns && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/slowdns-info > /dev/null 2>&1
cd /bin/slowdns && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/slowdns-socks > /dev/null 2>&1
cd /bin/slowdns && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/slowdns-ssh > /dev/null 2>&1
cd /bin/slowdns && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/slowdns-ssl > /dev/null 2>&1
cd /bin/slowdns && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/startdns > /dev/null 2>&1
cd /bin/slowdns && wget https://github.com/REDHAWKOG/OGENIO/raw/master/Modulos/stopdns > /dev/null 2>&1
cd /bin/ && chmod +x slowdns
cd /bin/slowdns && chmod +x dns-server
cd /bin/slowdns && chmod +x remove-slow
cd /bin/slowdns && chmod +x restartdns
cd /bin/slowdns && chmod +x slowdns-drop
cd /bin/slowdns && chmod +x slowdns-info
cd /bin/slowdns && chmod +x slowdns-socks
cd /bin/slowdns && chmod +x slowdns-ssh
cd /bin/slowdns && chmod +x slowdns-ssl
cd /bin/slowdns && chmod +x startdns
cd /bin/slowdns && chmod +x stopdns
done
pip install speedtest-cli
}
fun_bar 'inst_pct'
[[ -f "/usr/sbin/ufw" ]] && ufw allow 443/tcp ; ufw allow 80/tcp ; ufw allow 3128/tcp ; ufw allow 8799/tcp ; ufw allow 8080/tcp
clear
echo ""
echo -e "              \033[1;33m[\033[1;31m!\033[1;33m] \033[1;32mFINALIZANDO \033[1;33m[\033[1;31m!\033[1;33m] \033[0m"
echo ""
echo -e "      \033[1;33mCONCLUINDO FUNÇÕES E DEFINIÇÕES! \033[0m"
echo ""
fun_bar "$_Ink/list $_lnk $_Ink $_1nk $key"
echo ""
cd $HOME
echo -e "        \033[1;33m • \033[1;32mINSTALACAO CONCLUIDA\033[1;33m • \033[0m"
echo ""
echo -e "   GENIO HACKER X" | figlet
echo -e "\033[1;31m \033[1;33mPARA INICIAR DIGITE: \033[1;32mmenu\033[0m"
echo -e "\033[1;33m MAIS INFORMACOES \033[1;31m(\033[1;36mTELEGRAM\033[1;31m): \033[1;37m@OOGENIOHACKER\033[0m"
rm $HOME/Plus && cat /dev/null > ~/.bash_history && history -c
