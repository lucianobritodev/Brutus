#!/bin/bash

            ########################################################
            #                                                      #
            #    Instalador de Pacotes e Atualizador do Sistema    #
            #                                                      #
            #    Criador: Luciano Brito                            #
            #    Nome do Canal no You Tube: "Live Informática"     #
            #                                                      #
            ########################################################


#Respostas s/n
Sim="S"
sim="s"
Nao="N"
nao="n"


#Início: Instalação do GKSU
GKSU(){
	if [ -e '/usr/bin/gksu' ]
	then
		clear
	else
		echo -e '                                    \e[31;1m' ATENÇÃO!' \e[m'
		echo "                                     ********"
		echo ""
		echo "Pacote GKSU Não está Instalado!"
		echo "A Execução deste script só poderá continuar se o pacote 'GKSU' estiver Instalado!"
		echo "Você pode fazer a instalação agora, caso contrário, o script será encerrado."
		echo ""
		echo ""
		echo ""
		echo "Você deseja realizar a instalação do gksu?"
		echo -n "[Digite s/n]: "
		read resp
	  resp=`printf $resp | tr [a-z] [A-Z]`

		if [ "$resp" = "$Sim" ]
		then
		    clear
		    echo "Instalando GKSU"
		    echo "***************"
		    echo ""
		    sudo apt-get install gksu -y
		    echo ""
		    echo ""
		else
		    exit 0
		fi
		clear
	fi
} #Fim: Instalação do GKSU


#Início: Instalação do XTERM
function XTERM(){
    if ! [ -x /usr/bin/xterm ]
  	then
    	clear
        echo "Instalando XTerm"
        echo "****************"
        echo
    	echo "$senha1" | sudo -S apt-get install xterm -y
  	fi
} #Fim: Instalação do XTERM

GKSU

#Início: Informações Iniciais
INFO(){
	echo "          ************************************************************************"
	echo "          *                                                                      *"
	echo -e '          *                       \e[1mBem-Vindo ao Brutus     \e[m                       *'
	echo "          *                                                                      *"
	echo "          ************************************************************************"
	echo
	echo
	echo "Brutus é um Script de Pós Instalação de Distros Baseadas no 'Ubuntu'."
	echo "Ele tem a função de Baixar, Instalar e Atualizar os Seguintes Pacotes:"
	echo
	echo
	echo -e '==> \e[32;1mPacotes Básicos 		\e[m'
	echo -e '==> \e[33;1mPacotes Avançados 		\e[m'
	echo -e '==> \e[34;1mPacotes Development 	\e[m'
	echo
	echo
	echo "Para facilitar a visualização, coloque o terminal em 95x30 (95 colunas por 30 linhas)."
	echo "Para interromper o processo pressione as teclas 'Ctrl^C'."
	echo
	echo
	echo
	echo -ne 'Para Prosseguir Pressione \e[31;1mENTER\e[m: ' ; read
} #Fim: Informações Iniciais

INFO


#Início: Armazenamento de Senha
SENHA(){
	senha1=`gksu --print-pass -m "Requisição sudo!

	Digite a Senha de Super Usuário:"`
} #Fim: Armazenamento de Senha

SENHA

#Início: Barra de Progresso
#Adiciona Uma Barra de Progresso no APT-GET
ProgressBar(){
	if [ -e '/etc/apt/apt.conf.d' ]
	then
		if ! [ -e '/etc/apt/apt.conf.d/99progressbar' ]
		then
			echo "$senha1" | sudo -S touch /etc/apt/apt.conf.d/99progressbar
			echo "$senha1" | sudo -S bash -c 'echo -e "Dpkg::Progress-Fancy \"1\";" > /etc/apt/apt.conf.d/99progressbar'
		else
			echo "$senha1" | sudo -S bash -c 'echo -e "Dpkg::Progress-Fancy \"1\";" > /etc/apt/apt.conf.d/99progressbar'	
		fi
	else
		echo "$senha1" | sudo -S mkdir /etc/apt/apt.conf.d
		echo "$senha1" | sudo -S touch /etc/apt/apt.conf.d/99progressbar
		echo "$senha1" | sudo -S bash -c 'echo -e "Dpkg::Progress-Fancy \"1\";" > /etc/apt/apt.conf.d/99progressbar'
	fi
} #Fim: Barra de Progresso

ProgressBar

echo "$senha1" | sudo -S clear


#Início: Menu Principal
function mostramenu(){
   clear
   echo -e '         +=====================================================================+'
   echo -e '         |                            \e[1mMENU PRINCIPAL\e[m                           |'
   echo -e '         |                                                                     |'
   echo -e '         |                                  \e[1mdo\e[m                                 |'
   echo -e '         |                                                                     |'   
   echo -e '         |                                \e[1mBRUTUS\e[m                               |'
   echo -e '         |                                                                     |'
   echo -e '         +=====================================================================+'   
   echo
   echo
   echo "Pressione um número, em seguida, pressione ENTER para executar uma ação."
   echo
   echo -e '\e[31;1m   Opção:              Função:                         Descrição:\e[m'
   echo
   echo -e '\e[31;1m  [  1  ] \e[m Instalar Pacotes Básicos. -------- (Instala os Pacotes Básicos Com ou Sem PPAs)'
   echo -e '\e[31;1m  [  2  ] \e[m Instalar Pacotes Avançados. ------ (Instala Outros Pacotes)'
   echo -e '\e[31;1m  [  3  ] \e[m Instalar Pacotes Development. ---- (Instala Pacotes Para Desenvolvedores)'   
   echo -e '\e[31;1m  [  4  ] \e[m Atualizar Pacotes. --------------- (Atualiza Todos os Pacotes Instalados)'
   echo -e '\e[31;1m  [  5  ] \e[m Atualizar o Sistema. ------------- (Atualiza Todos os Pacotes e o Sistema)'
   echo -e '\e[31;1m  [  6  ] \e[m Checklist dos Pacotes. ----------- (Verifica e Lista se Pacotes foram Instalados)'
   echo -e '\e[31;1m  [  7  ] \e[m Limpar o Sistema. ---------------- (Limpa Todos os Arquivos Desnecessários)'
   echo -e '\e[31;1m  [  8  ] \e[m Atualizar Alterações de Boot. ---- (Atualiza a Ordem de Boot do Grub)'
   echo -e '\e[31;1m  [  9  ] \e[m Corrigir Pacotes Ociosos. -------- (Corrige Pacotes Quebrados e Dependências)'
   echo -e '\e[31;1m  [ 10  ] \e[m Desinstalar Pacotes. ------------- (Desinstala Pacotes a Partir do Nome)'
   echo
   echo -e '\e[31;1m  [  H  ] \e[m Informações do Script. ----------- (Lista Informações do Script)'
   echo -e '\e[31;1m  [  I  ] \e[m Informações do Sistema. ---------- (Lista Informações do Sistema)'
   echo -e '\e[31;1m  [  S  ] \e[m Sair. ---------------------------- (Sai do Script)'
   echo
   if [ "$1" ]; then echo -n "Escolha uma opção: " ; fi
} #Fim: Menu Principal


#Início: Menu Principal
function _menu(){
   clear
   while true
   do
      mostramenu normal
      read escolha
      escolha=`printf $escolha | tr [a-z] [A-Z]`
      echo
      echo
      case "$escolha" in
        1) InstalarPacotesBasicos ;;
        2) InstalarPacotesAvancados ;;
		3) Development ;;
        4) AtualizarPacotes ;;
        5) AtualizarSistema ;;
        6) VerificarPacotes ;;		
        7) LimparSistema ;;
        8) AtualizarGrub ;;
        9) CorrigirDependencias ;;
		10) Desinstalar ;;
        H) InformacoesScript ;;
        I) InformacoesSistema ;;
        S) Sair ;;
        *) Invalida ;;
      esac   
   done
} #Fim: Menu Principal


#Início: Informações do Sistema
function InformacoesSistema(){
  echo "$senha1" | sudo -S clear
  clear
  echo "               *************************************************"
  echo "               *                                               *"
  echo -e '               *            \e[1mInformações do Sistema\e[m             *'
  echo "               *                                               *"
  echo "               *************************************************"
  sleep 1
  echo

  if ! [ -x '/usr/bin/screenfetch' ]
  then
      echo "$senha1" | sudo -S apt-get install screenfetch -y
      clear
  fi

  echo -e "\e[31;1mInformações do Usuário:\e[m "
  echo "Usuário logado:        `whoami`"
  echo "Nome do Host:          $HOSTNAME"
  echo -n "Permissões:            "

  if [ '$USER adm' ]
  then
  	echo "O Usuário $USER Tem Permissão de adm!"
  else
  	echo "O Usuário $USER Não Tem Permissão de adm!"
  fi
  sleep 1
  echo

  echo -e "\e[31;1mResumo:\e[m"
  screenfetch -s
  sleep 1
  echo

  echo -e "\e[31;1mInformações do Sistema Operacional:\e[m"
  echo "Descrição:             `lsb_release -d | cut -c14-`"
  echo "Interface:             $GDMSESSION"
  echo "Kernel Ativo:          `uname -rm`"
  echo "Gestor de Sessão:      `cat /etc/X11/default-display-manager`"
  echo "Shell:                 $SHELL"
  sleep 1
  echo

  echo -e "\e[31;1mInformações da CPU:\e[m"
  lscpu | grep 'Model name' --color=never
  lscpu | grep -m1 'Ar' --color=never
  lscpu | grep -m1 'ID' --color=never
  echo "`lscpu | grep -m1 'CPU(s)' --color=never` núcleo(s)"
  lscpu | grep -m1 'Virtualiza' --color=never
  sleep 1
  echo

  echo -e "\e[31;1mInformações da Memória:\e[m"
  echo "`free -h`"
  sleep 1
  echo

  echo -e "\e[31;1mInformações dos Discos e Partições:\e[m"
  echo "`lsblk -o NAME,TYPE,FSTYPE,MOUNTPOINT,SIZE,OWNER,UUID`"
  sleep 1
  echo

  echo -e "\e[31;1mInformações da Placa-Mãe:\e[m"
  echo -n "Fabricante:         "
  echo "$senha1" | sudo -S dmidecode -s system-manufacturer
  echo -n "Modelo do Produto:  "
  echo "$senha1" | sudo -S dmidecode -s system-product-name
  echo -n "Número de Série:    "
  echo "$senha1" | sudo -S dmidecode -s system-serial-number
  sleep 1
  echo
  echo
  echo
  echo "Pressione ENTER para retornar ao Menu Principal ..."
  read
} #Fim: Informações do Sistema


#Início: Instalador de Pacotes Básicos
function InstalarPacotesBasicos(){
	clear
	echo "             *****************************************************************"
	echo "             *                                                               *"
	echo -e '             *\e[1m                  Instalação de Pacotes Básicos                \e[m*'
	echo "             *                                                               *"
	echo "             *****************************************************************"
	echo
	echo
	echo "Esta Sessão Irá Instalar Automaticamente os Seguintes Pacotes:"
	echo
	echo "==> Tema Papirus e Tema Arc          ==> OBS-Studio"
	echo "==> Monitor do Sistema               ==> Kazam"
	echo "==> GParted                          ==> Kdenlive"
	echo "==> Gnome-Disks                      ==> Gimp"
	echo "==> Brasero                          ==> Inkscape"
	echo "==> Audacity                         ==> ClipGrab"
	echo "==> Parole                           ==> Spotify"
	echo "==> VLC                              ==> Transmission"
	echo "==> Curlew                           ==> Pacote de Fontes da Microsoft"
	echo "==> Converseen"
	echo "==> LibreOffice, Pacote de Tradução e Tema de Ícones"
	echo
	echo
	echo
	echo "Você Deseja Prosseguir Com a Instalação dos Pacotes Básicos?"
	echo -n "[Digite s/n]: "
	read resp
	resp=`printf $resp | tr [a-z] [A-Z]`

	if [ "$resp" == "$Sim" ]
	then
		clear
		echo "             *****************************************************************"
		echo "             *                                                               *"
		echo -e '             *\e[1m                  Instalação de Pacotes Básicos                \e[m*'
		echo "             *                                                               *"
		echo "             *****************************************************************"
		echo
		echo
		echo "Você Deseja Adicionar PPA's para Manter as Atualizações dos Pacotes?"
		echo -n "[Digite s/n]: " ; read resp0
		resp0=`printf $resp0 | tr [a-z] [A-Z]`

		if [ "$resp0" == "$Sim" ]
		then
			echo
			echo -e '\e[32;1mOs PPAs Serão Adicionados!\e[m'
			echo
			sleep 2
		else
			echo
			echo -e '\e[31;1mOs PPAs Não Serão Adicionados!\e[m'
			echo
			sleep 2
		fi

		echo
		echo
		echo "Você Deseja Instalar Temas de Ícones e Tema GTK?"
		echo -n "[Digite s/n]: " ; read resp14
		resp14=`printf $resp14 | tr [a-z] [A-Z]`

		if [ "$resp14" == "$Sim" ]
		then
			echo ""
			echo -e '\e[32;1mOs Temas Serão Instalados!\e[m'
			echo ""
		  sleep 2
		else
			echo
			echo -e '\e[31;1mOs Temas Não Serão Instalados!\e[m'
			echo
			sleep 2
		fi

		if [ "$resp0" == "$Sim" ]
		then
		  clear
		  echo "Adicionando PPA's"
		  echo "*****************"
		  echo ""
		  echo "$senha1" | sudo -S add-apt-repository ppa:clipgrab-team/ppa -y
		  echo "$senha1" | sudo -S add-apt-repository ppa:obsproject/obs-studio -y
		  echo "$senha1" | sudo -S add-apt-repository ppa:kazam-team/stable-series -y
		  echo "$senha1" | sudo -S add-apt-repository ppa:kdenlive/kdenlive-stable -y
		  echo "$senha1" | sudo -S add-apt-repository ppa:libreoffice/ppa -y
		  echo "$senha1" | sudo -S add-apt-repository ppa:ubuntuhandbook1/apps -y
		  echo "$senha1" | sudo -S add-apt-repository ppa:papirus/papirus -y
		  echo "$senha1" | sudo -S add-apt-repository ppa:noobslab/themes -y
		  echo "$senha1" | sudo -S add-apt-repository ppa:noobslab/icons -y
		  echo "$senha1" | sudo -S add-apt-repository ppa:noobslab/apps -y
		  echo ""
		  echo ""
		fi

		if [ "$INSTANCE" == 'Unity' ]
		then
			echo "$senha1" | sudo -S add-apt-repository ppa:tualatrix/ppa
		fi

		clear
		echo "Atualizando o APT"
		echo "*****************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get update
		echo ""
		echo ""

		if [ "$resp14" == "$Sim" ]
		then
			clear
			echo "Instalando Temas"
			echo "****************"
			sleep 1
			echo ""
			echo "$senha1" | sudo -S apt-get install papirus-icon-theme -y
			echo "$senha1" | sudo -S apt-get install arc-theme -y
			echo ""
			echo ""
		fi

		if [ "$INSTANCE" == 'Unity' ]
		then
			clear
			echo "Instalando o Unity Tweak Tool"
			echo "*****************************"
			sleep 1
			echo ""
			echo "$senha1" | sudo -S apt-get install unity-tweak-tool -y

			clear
			echo "Instalando o Ubuntu Tweak"
			echo "*************************"
			sleep 1
			echo ""
			echo "$senha1" | sudo -S apt-get install ubuntu-tweak -y
		fi

		clear
		echo "Instalando o Monitor do Sistema"
		echo "*******************************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install gnome-system-monitor -y
		echo ""
		echo ""

		clear
		echo "Instalando o Gnome-Disks"
		echo "************************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install gnome-disk-utility -y
		echo ""
		echo ""

		clear
		echo "Instalando o GParted"
		echo "********************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install gparted -y
		echo ""
		echo ""

		clear
		echo "Instalando o Brasero"
		echo "********************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install brasero -y
		echo ""
		echo ""

		clear
		echo "Instalando o K3B"
		echo "****************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install k3b -y
		echo "$senha1" | sudo -S apt-get install k3b-i18n libk3b6-extracodecs -y
		echo ""
		echo ""

		clear
		echo "Instalando o LibreOffice"
		echo "************************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install libreoffice -y
		echo ""
		echo ""

		clear
		echo "Instalando Tradução, Ícones e Complementos para o LibreOffice"
		echo "*************************************************************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install libreoffice-l10n-pt-br -y
		echo "$senha1" | sudo -S apt-get install libreoffice-style-breeze -y
		echo "$senha1" | sudo -S apt-get install libreoffice-style-oxygen -y
		echo "$senha1" | sudo -S apt-get install libreoffice-dde -y
		echo "$senha1" | sudo -S apt-get install libreoffice-gtk -y
		echo ""
		echo ""

		clear
		echo "Instalando Pacote de Fontes da Microsoft"
		echo "****************************************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S bash -c 'echo "$senha1" | sudo -S apt-get install msttcorefonts -y --force-yes'
		#echo "$senha1" | sudo -S apt-get install msttcorefonts -y --force-yes
		echo ""
		echo ""

		clear
		echo "Instalando o ClipGrab"
		echo "*********************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install clipgrab -y
		echo ""
		echo ""

		clear
		echo "Instalando o Transmission"
		echo "*************************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install transmission -y
		echo ""
		echo ""

		clear
		echo "Instalando o VLC"
		echo "****************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install vlc -y
		echo ""
		echo ""

		clear
		echo "Instalando o Parole"
		echo "*******************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install parole -y
		echo ""
		echo ""

		clear
		echo "Instalando o Audacity"
		echo "*********************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install audacity -y
		echo ""
		echo ""

		clear
		echo "Instalando o Spotify"
		echo "********************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install spotify-client -y
		echo ""
		echo ""

		clear
		echo "Instalando o Curlew"
		echo "********************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install curlew -y
		echo ""
		echo ""

		clear
		echo "Instalando o Converseen"
		echo "***********************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install converseen -y
		echo ""
		echo ""

		clear
		echo "Instalando o Inkscape"
		echo "*********************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install inkscape -y
		echo ""
		echo ""

		clear
		echo "Instalando o Gimp"
		echo "*****************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install gimp -y
		echo ""
		echo ""

		clear
		echo "Instalando o OBS-Studio"
		echo "***********************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install obs-studio -y
		echo ""
		echo ""

		clear
		echo "Instalando o Kazam"
		echo "******************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install kazam -y
		echo ""
		echo ""

		clear
		echo "Instalando o Kdenlive"
		echo "*********************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install kdenlive -y
		echo "$senha1" | sudo -S apt-get install kde-l10n-ptbr -y
		echo "$senha1" | sudo -S apt-get install kde-runtime breeze -y
		echo ""
		echo ""

		clear
		echo "Instalando Meta-Pacote de Codecs"
		echo "********************************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install lame mpgtx sox -y
		echo "$senha1" | sudo -S apt-get install xubuntu-restricted-extras -y
		echo "$senha1" | sudo -S apt-get install mint-meta-codecs-core -y
		echo "$senha1" | sudo -S apt-get install ubuntu-restricted-extras -y
		echo ""
		echo ""

		clear
		echo "Instalando Descompactadores"
		echo "***************************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install rar unrar p7zip -y
		echo ""
		echo "" 

		clear
		echo "Instalando Terminal XTerm"
		echo "*************************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install xterm -y
		echo ""
		echo "" 

		clear
		echo "Instalando WMCTRL"
		echo "*****************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get install wmctrl -y
		echo ""
		echo "" 

		clear
		echo "Atualizando Todos os Pacotes Instalados"
		echo "***************************************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S apt-get update
		echo ""
		echo "$senha1" | sudo -S apt-get upgrade --fix-missing -y
		echo ""
		echo ""

		clear
		echo "Verificando e Corrigindo falhas na Instalação"
		echo "*********************************************"
		sleep 1
		echo ""
		echo "$senha1" | sudo -S dpkg --configure -a
		echo "$senha1" | sudo -S apt-get install -f -y --force-yes
		echo ""
		echo ""

		clear
		echo "*******************************************************"
		echo "*        O Processo de Instalação Foi Concluído!      *"
		echo "*******************************************************"
	else
		echo
		echo -e '\e[31;1mOs Pacotes Básicos Não Serão Instalados!\e[m'
		echo
	fi
	echo
	echo
	echo "Pressione ENTER para retornar ao Menu Principal ..."
	read
} #Fim: Instalador de Pacotes Básicos


#Início: Instalador de Pacotes Avançados
function PacotesAvancados(){
  clear
  echo "             *******************************************************************"
  echo "             *                                                                 *"
  echo -e '             *\e[1m                      Pacotes Avançados                          \e[m*'
  echo "             *                                                                 *"
  echo "             *******************************************************************"
  echo 
  echo "Esta Sessão Permite Realizar as Instalações dos Seguintes Pacotes:"
  echo
  echo -e '\e[31;1m [  1  ] \e[m Navegadores. ------------ (Firefox, Google Chrome, Opera e Chromium)'
  echo -e '\e[31;1m [  2  ] \e[m Dropbox. ---------------- (Serviço de Armazenamento de Arquivos em Nuvem)'
  echo -e '\e[31;1m [  3  ] \e[m Multisystem. ------------ (Criador de Pen-Drives Multiboot)'
  echo -e '\e[31;1m [  4  ] \e[m MultiBootUSB. ----------- (Criador de Pen-Drives Multiboot)'
  echo -e '\e[31;1m [  5  ] \e[m VirtualBox. ------------- (Serviço de Virtualização de Maquinas Reais)' 
  echo -e '\e[31;1m [  6  ] \e[m Steam. ------------------ (Cliente para Jogos)'
  echo -e '\e[31;1m [  7  ] \e[m PlayOnLinux. ------------ (Camada de Compatibilidade com Aplicações Windows)'
  echo -e '\e[31;1m [  8  ] \e[m Wine. ------------------- (Camada de Compatibilidade com Aplicações Windows)'
  echo -e '\e[31;1m [  9  ] \e[m Blender. ---------------- (Editor de Criador de Vídeos e Conteúdos 3D)'
  echo -e '\e[31;1m [ 10  ] \e[m Grub Customizer. -------- (Customizador do Bootloader Grub2)'
  echo -e '\e[31;1m [ 11  ] \e[m Synaptic. --------------- (Interface Gráfica para APT e DPKG)'
  echo -e '\e[31;1m [ 12  ] \e[m Stoq. ------------------- (Serviço de Gestão Empresarial)'
  echo -e '\e[31;1m [ 13  ] \e[m BibleTime & Xiphos. ----- (Bíblias de Estudos para Cristãos)'
  echo -e '\e[31;1m [ 14  ] \e[m Dicionário GoldenDict --- (Gestor de Multiplos Dicionários)'
  echo -e '\e[31;1m [ 15  ] \e[m WhastApp Desktop -------- (Aplicativo não Oficial do WhastApp para Desktop)'
  echo
  echo -e '\e[31;1m [  V  ] \e[m ... Voltar ao Menu Principal'
  echo -e '\e[31;1m [  S  ] \e[m ... Sair do Script'
  echo
  echo
  echo -n "Escolha Uma Opção: "
} #Fim: Instalador de Pacotes Avançados


#Início: Instalador de Pacotes Avançados
function InstalarPacotesAvancados(){
  clear
  until (())
  do
      PacotesAvancados normal
      read opcao
      opcao=`printf $opcao | tr [a-z] [A-Z]`
      echo
      echo
      case "$opcao" in
        1) Navegadores ;;
        2) Dropbox ;;
        3) Multisystem ;;
        4) MultiBootUSB ;;
        5) VirtualBox ;;
        6) Steam ;;
        7) PlayOnLinux ;;
        8) Wine ;;
        9) Blender ;;
        10) Grub_Customizer ;;
        11) Synaptic ;;
        12) Stoq ;;
        13) Biblias ;;
        14) Dicionario ;;
		15) WhastApp ;;
        V) Voltar ;;
        S) Sair ;;
        *) Invalida ;;
      esac   
  done
} #Fim: Instalador de Pacotes Avançados


#Início: Menu de Instalação de Navegadores
function menu_navegadores(){
    clear
    echo "             ********************************************************************"
    echo "             *                                                                  *"
    echo -e '             *\e[1m                    Instalador de Navegadores                     \e[m*'
    echo "             *                                                                  *"
    echo "             ********************************************************************"
    echo
    echo
    echo "Qual é o Navegador que Você Deseja Instalar?"
    echo
    echo -e '\e[31;1m [' 1 '] \e[m Mozilla Firefox. --------- (Open Source)'
    echo -e '\e[31;1m [' 2 '] \e[m Google Chrome. ----------- (Proprietário)'
    echo -e '\e[31;1m [' 3 '] \e[m Opera. ------------------- (Proprietário)'
    echo -e '\e[31;1m [' 4 '] \e[m Chromium. ---------------- (Open Source)'
    echo
    echo -e '\e[31;1m [' V '] \e[m ... Voltar Ao Menu de Pacotes Avançados'
    echo -e '\e[31;1m [' S '] \e[m ... Sair do Script'
    echo
    echo
    echo -n "Escolha Uma Opção: "
} #Fim: Menu de Instalação de Navegadores


#Início: Menu de Instalação de Navegadores
function Navegadores(){
   clear
   until (())
   do
      menu_navegadores normal
      read opcao
      opcao=`printf $opcao | tr [a-z] [A-Z]`
      echo
      echo
      case "$opcao" in
        1) Firefox ;;
        2) Chrome ;;
        3) Opera ;;
        4) Chromium ;;
        V) Voltar1 ;;
        S) Sair ;;
        *) Invalida ;;
      esac   
   done
} #Fim: Menu de Instalação de Navegadores


#Início: Instalação do Firefox
Firefox(){
    if ! [ -x /usr/bin/firefox ]
    then
        clear
        echo "Instalando Firefox"
        echo "******************"
        echo
        echo "$senha1" | sudo -S apt-get install firefox -y
        echo "$senha1" | sudo -S apt-get install -f -y --force-yes
        echo
        if [ -x /usr/bin/firefox ]
        then
          echo "==> Firefox Está Instalado!"
        else
          echo "xxx> O Firefox Não Foi Instalado!"
        fi
    else
        echo
        echo "==> O Firefox Já Está Instalado!"
    fi
    echo
    echo
    echo
    echo "Pressione ENTER para retornar ao Menu de Navegadores!"
    read
} #Fim: Instalação do Firefox


#Início: Instalação do Chrome
function Chrome(){
    if ! [ -x /usr/bin/google-chrome-stable ]
    then
        clear
        echo "Instalando Google Chrome"
        echo "************************"
        echo
        echo "$senha1" | sudo -S apt-get install apt-transport-https -y
        echo "$senha1" | sudo -S sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
        echo "$senha1" | sudo -S wget -q https://dl.google.com/linux/linux_signing_key.pub -O- echo "senha1" | sudo -S apt-key add -
        echo "$senha1" | sudo -S apt-get update
        echo "$senha1" | sudo -S apt-get install google-chrome-stable -y
        echo "$senha1" | sudo -S apt-get install -f -y --force-yes
        echo
        if [ -x /usr/bin/google-chrome-stable ]
        then
          echo "==> Google Chrome Está Instalado!"
        else
          echo "xxx> O Google Chrome Não Foi Instalado!"
        fi
    else
        echo
        echo "==> O Google Chrome Já Está Instalado!"
    fi
    echo
    echo
    echo
    echo "Pressione ENTER para retornar ao Menu de Navegadores!"
    read
} #Fim: Instalação do Chrome


#Início: Instalação do Opera
function Opera(){
    if ! [ -x /usr/bin/opera ]
    then
        clear
        echo "Instalando Opera"
        echo "****************"
        echo
        echo "$senha1" | sudo -S add-apt-repository 'deb https://deb.opera.com/opera-stable/ stable non-free'
        echo "$senha1" | sudo -S wget -q https://deb.opera.com/archive.key -O- echo "$senha1" | sudo -S apt-key add -
        echo "$senha1" | sudo -S apt-get update            
        echo "$senha1" | sudo -S apt-get install opera-stable -y
        echo "$senha1" | sudo -S apt-get install -f -y --force-yes
        echo
        if [ -x /usr/bin/opera ]
        then
          echo "==> Opera Está Instalado!"
        else
          echo "xxx> O Opera Não Foi Instalado!"
        fi
    else
        echo
        echo "==> O Opera Já Está Instalado!"
    fi
    echo
    echo
    echo
    echo "Pressione ENTER para retornar ao Menu de Navegadores!"
    read
} #Fim: Instalação do Opera


#Início: Instalação do Chromium
function Chromium(){
    if ! [ -x /usr/bin/chromium-browser ]
    then
        clear
        echo "Instalando Chromium"
        echo "*******************"
        echo
        echo "$senha1" | sudo -S apt-get install chromium-browser -y
        echo "$senha1" | sudo -S apt-get install -f -y --force-yes
        echo
        if [ -x /usr/bin/chromium-browser ]
        then
          echo "==> Chromium Está Instalado!"
        else
          echo "xxx> O Chromium Não Foi Instalado!"
        fi
    else
        echo
        echo "==> O Chromium Já Está Instalado!"
    fi
    echo
    echo
    echo
    echo "Pressione ENTER para retornar ao Menu de Navegadores!"
    read
} #Fim: Instalação do Chromium


#Início: Instalação do DropBox
function Dropbox(){
	until (())
	do
	  	clear
	  	echo "Instalação do DropBox"
	  	echo "*********************"
	  	echo
	  	echo
      	if ! [ -x '/usr/bin/dropbox' ]
      	then
          	echo
          	echo "Qual é o Gerenciador de Arquivos Padrão do Seu Sistema?"
          	echo
          	echo -e '\e[31;1m [' 1 '] \e[m Nautilus. ---------- (Padrão do Gnome e Unity)'
          	echo -e '\e[31;1m [' 2 '] \e[m Nemo. -------------- (Padrão do Cinnamon)'
          	echo -e '\e[31;1m [' 3 '] \e[m Thunar. ------------ (Padrão do XFCE)'
          	echo -e '\e[31;1m [' 4 '] \e[m Caja. -------------- (Padrão do Mate)'
         	echo -e '\e[31;1m [' 5 '] \e[m Dolphin. ----------- (Padrão do KDE Plasma)'
          	echo -e '\e[31;1m [' 6 '] \e[m DDE-File-Manager. -- (Padrão do Deepin)'
          	echo
          	echo -e '\e[31;1m [' V '] \e[m ... Voltar ao Menu de Pacotes Avançados'
          	echo -e '\e[31;1m [' S '] \e[m ... Sair do Script'
          	echo
          	echo -n "Digite um número e precione ENTER: "
          	read resp4
          	resp4=`printf $resp4 | tr [a-z] [A-Z]`

     		case $resp4 in

       			#Dropbox para o Nautilus
          		1)
					XTERM
              		clear
              		echo "Instalando Nautilus-DropBox"
              		echo "***************************"
              		echo
              		echo "$senha1" | sudo -S apt-get install nautilus-dropbox -y
              		echo "$senha1" | sudo -S apt-get install -f -y --force-yes
              		echo "$senha1" | sudo -S xterm -e dropbox start -i &
              		sleep 5

              		if [ -x /usr/bin/dropbox ]
              		then
              			echo
                		echo "==> DropBox Está Instalado!"
             		else
             			echo
                		echo "xxx> O DropBox Não Foi Instalado!"
              		fi
            		echo
              		echo
              		echo
              		echo "Pressione ENTER para Voltar ao Menu de Pacotes Avançados!"
              		read		
          		;;

	          	#Dropbox para o Nemo
    	      	2)
					XTERM
        	    	clear
              		echo "Instalando Nemo-DropBox"
              		echo "***********************"
              		echo
              		echo "$senha1" | sudo -S apt-get install nemo-dropbox -y
              		echo "$senha1" | sudo -S apt-get install -f -y --force-yes
              		echo "$senha1" | sudo -S xterm -e dropbox start -i &
              		sleep 5

              		if [ -x /usr/bin/dropbox ]
              		then
              			echo
                		echo "==> DropBox Está Instalado!"
              		else
              			echo
                		echo "xxx> O DropBox Não Foi Instalado!"
              		fi
            		echo
              		echo
              		echo
              		echo "Pressione ENTER para Voltar ao Menu de Pacotes Avançados!"
              		read
          		;;

          		#Dropbox para o Thunar
          		3)
              		XTERM
              		clear
              		echo "Instalando Thunar-DropBox"
              		echo "*************************"
              		echo
              		echo "$senha1" | sudo -S apt-get install thunar-dropbox-plugin -y
              		echo "$senha1" | sudo -S apt-get install dropbox -y
              		echo "$senha1" | sudo -S apt-get install -f -y --force-yes
              		echo "$senha1" | sudo -S xterm -e dropbox start -i &
              		sleep 5

              		if [ -x /usr/bin/dropbox ]
              		then
              			echo
                		echo "==> DropBox Está Instalado!"
              		else
              			echo
                		echo "xxx> O DropBox Não Foi Instalado!"
              		fi
            		echo
              		echo
              		echo
              		echo "Pressione ENTER para Voltar ao Menu de Pacotes Avançados!"
              		read
				;;

				#Dropbox para o Caja
				4)
              		XTERM
              		clear
              		echo "Instalando Caja-DropBox"
              		echo "***********************"
              		echo
              		echo "$senha1" | sudo -S apt-get install caja-dropbox -y
              		echo "$senha1" | sudo -S apt-get install -f -y --force-yes
              		echo "$senha1" | sudo -S xterm -e dropbox start -i &
              		sleep 5

              		if [ -x /usr/bin/dropbox ]
              		then
                		echo
                		echo "==> DropBox Está Instalado!"
              		else
              			echo
                		echo "xxx> O DropBox Não Foi Instalado!"
              		fi
              		echo
            		echo
              		echo
              		echo
              		echo "Pressione ENTER para Voltar ao Menu de Pacotes Avançados!"
              		read
				;;

				#Dropbox para o Dolphin
				5)
            		XTERM
            		clear
              		echo "Instalando DropBox"
              		echo "******************"
              		echo
              		echo "$senha1" | sudo -S apt-get install dropbox -y
              		echo "$senha1" | sudo -S apt-get install -f -y --force-yes
              		echo "$senha1" | sudo -S xterm -e dropbox start -i &
              		sleep 5

              		if [ -x /usr/bin/dropbox ]
              		then
              			echo
                		echo "==> DropBox Está Instalado!"
              		else
              			echo
                		echo "xxx> O DropBox Não Foi Instalado!"
              		fi
              		echo
              		echo "Para o Ícone aparecer na bandeja, ative a opção nas configurações do Dolphin!"
              		echo
              		echo
              		echo
              		echo "Pressione ENTER para Voltar ao Menu de Pacotes Avançados!"
              		read
				;;

				#Início: Dropbox para o DDE-File-Manager
				6)
              		XTERM
              		clear
              		echo "Instalando DropBox"
              		echo "******************"
              		echo
              		echo "$senha1" | sudo -S apt-get install dropbox -y
              		echo "$senha1" | sudo -S apt-get install -f -y --force-yes
              		echo "$senha1" | sudo -S xterm -e dropbox start -i &
              		sleep 5

              		if [ -x /usr/bin/dropbox ]
              		then
                		echo
                		echo "==> DropBox Está Instalado!"
              		else
              			echo
                		echo "xxx> O DropBox Não Foi Instalado!"
              		fi
            		echo
              		echo
              		echo
              		echo "Pressione ENTER para Voltar ao Menu de Pacotes Avançados!"
              		read
				;; #Fim: Dropbox para o DDE-File-Manager

				V) InstalarPacotesAvancados ;;
				S) Sair ;;
				*) 
					echo
              		echo "Opção Inválida!"
				;;
        	esac

  		else
      		echo
      		echo "==> DropBox Já Está Instalado!"
    		echo
      		echo
      		echo
      		echo "Pressione ENTER para Voltar ao Menu de Pacotes Avançados!"
      		read
      		InstalarPacotesAvancados
  		fi
    done
} #Fim: Instalação do DropBox


#Início: Instalação do Multissystem
function Multisystem(){
  clear
  echo "Instalação do Multissystem"
  echo "**************************"
  echo
  echo
  echo "Você Deseja Instalar o Multissystem?"
  echo -n "[Digite s/n]: " ; read resp5
  resp5=`printf $resp5 | tr [a-z] [A-Z]`
  
  if [ "$resp5" = "$Sim" ]
  then
      if ! [ -x /usr/local/bin/multisystem ]
      then
          clear
          echo "Instalando o Multissystem"
          echo "*************************"
          echo
          echo "$senha1" | sudo -S bash -c 'echo "deb http://liveusb.info/multisystem/depot all main" >> /etc/apt/sources.list'
          echo "$senha1" | sudo -S wget -q http://liveusb.info/multisystem/depot/multisystem.asc -O- echo "$senha1" | sudo -S apt-key add -
          echo "$senha1" | sudo -S apt-get update
          echo "$senha1" | sudo -S apt-get install multisystem -y
          echo "$senha1" | sudo -S apt-get install -f -y --force-yes
        echo
      if ! [ '$USER adm' ]
      then
        echo "$senha1" | sudo -S gpasswd -a $USER adm
      fi
          echo
          if [ -x /usr/local/bin/multisystem ]
          then
              echo "==> Multisystem Está Instalado!"
          else
              echo "xxx> O Multisystem Não Foi Instalado!"
          fi
      if [ '$USER adm' ]
      then
        echo
        echo "O Usuário $USER É ADM!"
        echo
      else
        echo
        echo "O Usuário $USER Não Faz Parte do Grupo de ADM!"
        echo
      fi
          sleep 2
      else
        if ! [ '$USER adm' ]
        then
              echo "$senha1" | sudo -S gpasswd -a $USER adm
        fi
          echo
          echo "==> O Multisystem Já Está Instalado!"
      if [ '$USER adm' ]
      then
        echo
        echo "O Usuário $USER É ADM!"
        echo
      else
        echo
        echo "O Usuário $USER Não Faz Parte do Grupo de ADM!"
        echo
      fi
          sleep 2
      fi
      echo
  else
      echo
      echo "xxx> O Multisystem Não Será Instalado!"
      echo
      sleep 2
  fi
  echo
  echo
  echo
  echo "Pressione ENTER para retornar ao Menu ..."
  read
} #Fim: Instalação do Multissystem


#Início: Instalação do MultiBootUSB
function MultiBootUSB(){
  clear
  echo "Instalação do MultiBootUSB"
  echo "**************************"
  echo
  echo
  echo "Você Deseja Instalar o MultiBootUSB?"
  echo -n "[Digite s/n]: " ; read resp30
  resp30=`printf $resp30 | tr [a-z] [A-Z]`
  
  if [ "$resp30" = "$Sim" ]
  then
      if ! [ -x '/usr/bin/multibootusb-pkexec' ]
      then
          clear
          echo "Instalado MultibootUSB!"
          echo "***********************"
          echo
          echo "$senha1" | sudo -S apt-get install python3-multibootusb -y
          echo "$senha1" | sudo -S apt-get install qemu -y

          #Instalação Através do Pacote .deb
          if ! [ -x '/usr/bin/multibootusb-pkexec' ]
          then
              if [ -e '/home/$USER/python3-multibootusb_8.8.0-1_all.deb*' ]
              then
                  cd /home/$USER
                  echo "$senha1" | sudo -S dpkg -i python3-multibootusb_8.8.0-1_all.deb*
                  echo "$senha1" | sudo -S dpkg --configure -a
                  echo "$senha1" | sudo -S apt-get update
                  echo "$senha1" | sudo -S apt-get install python3-multibootusb --only-upgrade -y
                  echo "$senha1" | sudo -S apt-get install -f -y --force-yes
                  echo "$senha1" | sudo -S rm -Rf python3-multibootusb_8.8.0-1_all.deb
                  echo
                  if [ -x '/usr/bin/multibootusb-pkexec' ]
                  then
                      echo "==> MultibootUSB Está Instalado!"
                  else
                      echo "xxx> O MultibootUSB Não Foi Instalado!"
                  fi
              else
                  cd /home/$USER
                  wget -c 'https://ufpr.dl.sourceforge.net/project/multibootusb/8.8.0/Linux/python3-multibootusb_8.8.0-1_all.deb'
                  if [ -e /home/$USER/python3-multibootusb_8.8.0-1_all.deb ]
                  then
                      echo "$senha1" | sudo -S dpkg -i python3-multibootusb_8.8.0-1_all.deb*
                      echo "$senha1" | sudo -S dpkg --configure -a
                      echo "$senha1" | sudo -S apt-get update
                      echo "$senha1" | sudo -S apt-get install python3-multibootusb --only-upgrade -y
                      echo "$senha1" | sudo -S apt-get install -f -y --force-yes
                      echo "$senha1" | sudo -S rm -Rf python3-multibootusb_8.8.0-1_all.deb
                      echo
                      if [ -x '/usr/bin/multibootusb-pkexec' ]
                      then
                          echo "==> MultibootUSB Está Instalado!"
                      else
                          echo "xxx> O MultibootUSB Não Foi Instalado!"
                      fi
                  else
                      echo
                      echo "O Arquivo Não Foi Baixado, Por Isso, Não Será Instalado!"
                      echo
                      sleep 2
                  fi
              fi
                  else
                  echo
                  echo "==> MultiBootUSB Já Está Instalado!"
                  sleep 2
              fi
      else
          echo
          echo "==> MultiBootUSB Já Está Instalado!"
          sleep 2
      fi
  else
      echo
      echo "xxx> O MultiBootUSB Não Será Instalado!"
      echo
      sleep 2
  fi
  echo
  echo
  echo
  echo "Pressione ENTER para retornar ao Menu ..."
  read
} #Fim: Instalação do MultiBootUSB
 

#Início: Instalação do VirtualBox
function VirtualBox(){
  clear
  echo "Instalação do VirtualBox"
  echo "************************"
  echo
  echo
  echo "Você Deseja Instalar o VirtualBox?"
  echo -n "[Digite s/n]: " ; read resp6
  resp6=`printf $resp6 | tr [a-z] [A-Z]`
  
  if [ "$resp6" = "$sim" ] || [ "$resp6" = "$Sim" ]
  then
      if ! [ -x /usr/bin/virtualbox ]
      then
          clear
          echo "Instalando o VirtualBox"
          echo "***********************"
          echo
          echo "$senha1" | sudo -S apt-get install virtualbox virtualbox-qt -y
          echo
          echo
          if [ -x /usr/bin/virtualbox ]
          then
              echo "==> VirtualBox Está Instalado!"
          else
              echo "xxx> O VirtualBox Não Foi Instalado!"
          fi
          echo
          sleep 2
      else
          echo
          echo "==> VirtualBox Já Está Instalado!"
          echo
          sleep 2
      fi
  else
      echo
      echo "xxx> O VirtualBox Não Será Instalado!"
      echo
      sleep 2
  fi
  echo
  echo
  echo
  echo "Pressione ENTER para retornar ao Menu ..."
  read
} #Fim: Instalação do VirtualBox


#Início: Instalação do Steam
function Steam(){
  clear
  echo "Instalação do Steam"
  echo "*******************"
  echo
  echo
  echo "Você Deseja Instalar o Steam?"
  echo -n "[Digite s/n]: " ; read resp7
  resp7=`printf $resp7 | tr [a-z] [A-Z]`
  
  if [ "$resp7" = "$Sim" ]
  then
      if ! [ -x /usr/games/steam ]
      then
          clear
          echo "Instalando o Steam"
          echo "******************"
          echo
          echo "$senha1" | sudo -S apt-get install steam -y
          echo
          echo
          if [ -x /usr/games/steam ]
          then
            echo "==> Steam Está Instalado!"
          else
            echo "xxx> O Steam Não Foi Instalado!"
          fi
          echo
          sleep 2
      else
          echo
          echo "==> Steam Já Está Instalado!"
          echo
          sleep 2
      fi
  else
      echo
      echo "xxx> O Steam Não Será Instalado!"
      echo
      sleep 2
  fi
  echo
  echo
  echo
  echo "Pressione ENTER para retornar ao Menu ..."
  read
} #Fim: Instalação do Steam


#Início: Instalação do PalyOnLinux
function PlayOnLinux(){
  clear
  echo "Instalação do PlayOnLinux"
  echo "*************************"
  echo
  echo
  echo "Você Deseja Instalar o PlayOnLinux?"
  echo -n "[Digite s/n]: " ; read resp8
  resp8=`printf $resp8 | tr [a-z] [A-Z]`
  
  if [ "$resp8" = "$Sim" ]
  then
      if ! [ -x /usr/bin/playonlinux ]
      then
          clear
          echo "Instalando o PlayOnLinux"
          echo "************************"
          echo
          echo "$senha1" | sudo -S apt-get install playonlinux -y
          echo "$senha1" | sudo -S apt-get install winbind -y
          echo
          echo
          if [ -x /usr/bin/playonlinux ]
          then
            echo "==> PlayOnLinux Está Instalado!"
          else
            echo "xxx> O PlayOnLinux Não Foi Instalado!"
          fi
          echo
          sleep 2
      else
          echo
          echo "==> PlayOnLinux Já Está Instalado!"
          echo
          sleep 2
      fi
  else
      echo
      echo "xxx> O PlayOnLinux Não Será Instalado!"
      echo
      sleep 2
  fi
  echo
  echo
  echo
  echo "Pressione ENTER para retornar ao Menu ..."
  read
} #Fim: Instalação do PalyOnLinux


#Início: Instalação do Wine
function Wine(){
  clear
  echo "Instalação do Wine"
  echo "******************"
  echo
  echo
  echo "Você Deseja Instalar o Wine?"
  echo -n "[Digite s/n]: " ; read resp41
  resp41=`printf $resp41 | tr [a-z] [A-Z]`
  
  if [ "$resp41" = "$Sim" ]
  then
      if ! [ -x /usr/bin/wine ]
      then
          clear
          echo "Instalando o Wine"
          echo "*****************"
          echo
          echo "$senha1" | sudo -S apt-get install wine -y
          echo "$senha1" | sudo -S apt-get install winbind -y
          echo
          echo
          if [ -x /usr/bin/wine ]
          then
            echo "==> Wine Está Instalado!"
          else
            echo "xxx> O Wine Não Foi Instalado!"
          fi
          echo
          sleep 2
      else
          echo
          echo "==> Wine Já Está Instalado!"
          echo
          sleep 2
      fi
  else
      echo
      echo "xxx> O Wine Não Será Instalado!"
      echo
      sleep 2
  fi
  echo
  echo
  echo
  echo "Pressione ENTER para retornar ao Menu ..."
  read
} #Fim: Instalação do Wine


#Início: Instalação do Blender
function Blender(){
  clear
  echo "Instalação do Blender"
  echo "*********************"
  echo
  echo
  echo "Você Deseja Instalar o Blender?"
  echo -n "[Digite s/n]: " ; read resp9
  resp9=`printf $resp9 | tr [a-z] [A-Z]`
  
  if [ "$resp9" = "$Sim" ]
  then
      if ! [ -x /usr/bin/blender ]
      then
			clear
			echo "Instalando o Blender"
			echo "********************"
			echo
			echo "$senha1" | sudo -S add-apt-repository ppa:thomas-schiex/blender -y
			echo "$senha1" | sudo -S apt-get update
	    	echo "$senha1" | sudo -S apt-get install blender -y
			echo
			echo
			if [ -x /usr/bin/blender ]
			then
				echo "==> Blender Está Instalado!"
			else
				echo "xxx> O Blender Não Foi Instalado!"
			fi
			echo
			sleep 2
      else
			echo
			echo "==> Blender Já Está Instalado!"
			echo
			sleep 2
      fi
  else
      echo
      echo "xxx> O Blender Não Será Instalado!"
      echo
      sleep 2
  fi
  echo
  echo
  echo
  echo "Pressione ENTER para retornar ao Menu ..."
  read
} #Fim: Instalação do Blender


#Início: Instalação do Grub-Customizer
function Grub_Customizer(){
	clear
	echo "Instalação do Grub-Customizer"
	echo "*****************************"
	echo
	echo
	echo "Você Deseja Instalar o Grub-Customizer?"
	echo -n "[Digite s/n]: " ; read resp10
	resp10=`printf $resp10 | tr [a-z] [A-Z]`
  
	if [ "$resp10" = "$Sim" ]
	then
    	if ! [ -x '/usr/bin/grub-customizer' ]
    	then
        	clear
        	echo "Instalando o Grub-Customizer"
        	echo "****************************"
        	echo
        	echo "$senha1" | sudo -S add-apt-repository ppa:danielrichter2007/grub-customizer -y
        	echo "$senha1" | sudo -S apt-get update
        	echo "$senha1" | sudo -S apt-get install grub-customizer -y
        	echo
        	echo
        	if [ -x /usr/bin/grub-customizer ]
        	then
            	echo "==> Grub-Customizer Está Instalado!"
        	else
            	echo "xxx> O Grub-Customizer Não Foi Instalado!"
        	fi
        	echo
        	sleep 2
    	else
        	echo
        	echo "==> Grub-Customizer Já Está Instalado!"
        	echo
        	sleep 2
    	fi
	else
    	echo
    	echo "xxx> O Grub-Customizer Não Será Instalado!"
    	echo
      sleep 2
	fi
	echo
	echo
	echo
	echo "Pressione ENTER para retornar ao Menu ..."
	read
} #Fim: Instalação do Grub-Customizer


#Início: Instalação do Synaptic
function Synaptic(){
	clear
	echo "Instalação do Synaptic"
	echo "**********************"
	echo
	echo
	echo "Você Deseja Instalar o Synaptic?"
	echo -n "[Digite s/n]: " ; read resp11
	resp11=`printf $resp11 | tr [a-z] [A-Z]`
  
  	if [ "$resp11" = "$Sim" ]
  	then
    	if ! [ -x /usr/sbin/synaptic ]
    	then
          	clear
          	echo "Instalando o Synaptic"
          	echo "*********************"
          	echo
          	echo "$senha1" | sudo -S apt-get install synaptic -y
          	echo
        	echo
        	if [ -x /usr/sbin/synaptic ]
        	then
            	echo "==> Synaptic Está Instalado!"
        	else
            	echo "xxx> O Synaptic Não Foi Instalado!"
        	fi
        	echo
        	sleep 2
    	else
        	echo
        	echo "==> Synaptic Já Está Instalado!"
        	echo
          sleep 2
    	fi
	else
      echo
      echo "xxx> O Synaptic Não Será Instalado!"
      echo
      sleep 2
	fi
	echo
	echo
	echo
	echo "Pressione ENTER para retornar ao Menu ..."
	read
} #Fim: Instalação do Synaptic

#Início: Instalação do Stoq
function Stoq(){
  clear
  echo "Instalação do Stoq"
  echo "******************"
  echo
  echo
  echo "Você Deseja Instalar o Stoq?"
  echo -n "[Digite s/n]: " ; read resp12
  resp12=`printf $resp12 | tr [a-z] [A-Z]`

  if [ "$resp12" = "$Sim" ]
  then
      if ! [ -x /usr/bin/stoq ]
      then
          clear
          echo "Instalando o Stoq"
          echo "*****************"
          echo
          echo "$senha1" | sudo -S apt-add-repository ppa:stoq-dev/lancamentos -y
          echo "$senha1" | sudo -S apt-get update
          echo "$senha1" | sudo -S apt-get install stoq stoq-server -y
          echo
          echo
          if [ -x /usr/bin/stoq ]
          then
              echo "==> Stoq Está Instalado!"
          else
              echo "xxx> O Stoq Não Foi Instalado!"
          fi
          echo
          sleep 2
      else
          echo
          echo "==> O Stoq Já Está Instalado!"
          sleep 2
      fi
  else
      echo
      echo "xxx> O Stoq Não Será Instalado!"
      echo
      sleep 2
  fi
  echo
  echo
  echo
  echo "Pressione ENTER para retornar ao Menu ..."
  read 
} #Fim: Instalação do Stoq


#Início: Instalação da BibleTime & Xiphos
function Biblias(){
  clear
  echo "Instalação das Bíblias BibleTime & Xiphos"
  echo "*****************************************"
  echo
  echo
  echo "Você Deseja Instalar as Bíblias BibleTime & Xiphos?"
  echo -n "[Digite s/n]: " ; read resp17
  resp17=`printf $resp17 | tr [a-z] [A-Z]`

  if [ "$resp17" = "$Sim" ]
  then
      #Instalação da BibleTime  
      if ! [ -x /usr/bin/bibletime ] && [ -x /usr/bin/xiphos ]
      then
          clear
          echo "Instalando a BibleTime"
          echo "**********************"
          echo
          echo "$senha1" | sudo -S add-apt-repository ppa:unit193/crosswire -y
          echo "$senha1" | sudo -S apt-get update
          echo "$senha1" | sudo -S apt-get install bibletime -y
          echo "$senha1" | sudo -S apt-get install qt4-qtconfig -y
          echo "$senha1" | sudo -S apt-get install -f -y --force-yes
          echo
          echo
          if [ -x /usr/bin/bibletime ]
          then
              echo "==> BibleTime Está Instalada!"
          else
              echo "xxx> A BibleTime Não Foi Instalada!"
          fi
      else
          echo
          echo "==> BibleTime Já Está Instalada!"
          sleep 2
      fi

      #Instalação da Xiphos
      if ! [ -x /usr/bin/xiphos ]
      then
          clear
          echo "Instalando a Xiphos"
          echo "*******************"
          echo
          echo "$senha1" | sudo -S apt-get install xiphos -y
          echo "$senha1" | sudo -S apt-get install qt4-qtconfig -y
          echo "$senha1" | sudo -S apt-get install -f -y --force-yes
          echo
          echo
          if [ -x /usr/bin/xiphos ]
          then
              echo "==> Xiphos Está Instalada!"
          else
              echo "xxx> A Xiphos Não Foi Instalada!"
          fi
          sleep 2
      else
          echo
          echo "==> Xiphos Já Está Instalada!"
          sleep 2
      fi
      echo
  else
      echo
      echo "xxx> As Bíblias BibleTime e Xiphos Não Serão Instaladas!"
      echo
      sleep 2
  fi
  echo
  echo
  echo
  echo "Pressione ENTER para retornar ao Menu ..."
  read
} #Fim: Instalação da BibleTime & Xiphos


#Início: Instalação do Dicionário GoldenDict
function Dicionario(){
  clear
  echo "Instalação do Dicionário GoldenDict"
  echo "***********************************"
  echo
  echo
  echo "Você Deseja Instalar o Dicionário GoldenDict?"
  echo -n "[Digite s/n]: "; read resp40
  resp40=`printf $resp40 | tr [a-z] [A-Z]`

  if [ "$resp40" = "$Sim" ]
  then
      if ! [ -x '/usr/bin/goldendict' ]
      then
          clear
          echo "Atualizando o APT"
          echo "*****************"
          echo
          echo "$senha1" | sudo -S apt-get update

          clear
          echo "Instalando GoldenDict"
          echo "*********************"
          echo        
          echo "$senha1" | sudo -S apt-get install goldendict -y
          if ! [ -x '/usr/bin/goldendict' ]
          then
              cd /home/$USER
              wget -c 'http://http.us.debian.org/debian/pool/main/w/wordnet/goldendict-wordnet_3.0-33_all.deb' -O 'goldendict.deb'
              echo "$senha1" | sudo -S dpkg -i goldendict.deb*
              echo "$senha1" | sudo -S apt-get install -f -y --force-yes
              if ! [ -x '/usr/bin/goldendict' ]
              then
                  echo "$senha1" | sudo -S dpkg -i *.deb*
                  echo "$senha1" | sudo -S apt-get install -f -y --force-yes
              else
                  echo "$senha1" | sudo -S rm -Rf goldendict.deb*
              fi
          fi
          if [ -e '/home/$USER/.goldendict' ]
          then
              mkdir /home/$USER/.goldendict/dictionary
          else
              mkdir /home/$USER/.goldendict
              mkdir /home/$USER/.goldendict/dictionary
          fi
          wget -cP /home/$USER/.goldendict/dictionary 'http://dl.babsft.com/info/glossaries/C576/Wikipedia_Portuguese_sub.BGL'
          wget -cP /home/$USER/.goldendict/dictionary 'http://dl.babsft.com/info/glossaries/38C/Babylon_English_Portuguese.BGL'
          wget -cP /home/$USER/.goldendict/dictionary 'http://dl.babsft.com/info/glossaries/BABD/Global_Glossary__EN_US_PT_BR_.BGL'
          wget -cP /home/$USER/.goldendict/dictionary 'http://dl.babsft.com/info/glossaries/4EA/Babylon_Portuguese_English_dic.BGL'
          wget -cP /home/$USER/.goldendict/dictionary 'https://raw.githubusercontent.com/fabceolin/dotfiles/master/dicionarios/Aurelio_pt_pt.BGL'

          if [ -x '/usr/bin/goldendict' ]
          then
              echo
              echo "==> O Dicionário GoldenDict Está Instalado! "
              echo
          else
              echo
              echo "xxx> O Dicionário GoldenDict Não Foi Instalado!"
              echo
          fi
          sleep 2
      else
          echo
          echo "==> O Dicionário GoldenDict Já Está Instalado! "
          sleep 2
      fi
  else
      echo
      echo "xxx> Dicionário GoldenDict Não Será Instalado!"
      sleep 2
  fi
  echo
  echo
  echo
  echo "Pressione ENTER para retornar ao Menu ..."
  read
} #Fim: Instalação do Dicionário GoldenDict


#Início: Instalação do WhatsApp Desktop
function WhastApp(){
    clear
    echo "Instalando WhatsApp-Desktop"
    echo "***************************"
	echo
	echo
	echo "Você Deseja Instalar o WhatsApp-Desktop?"
	echo -n "[Digite s/n]: "; read resp41
	resp41=`printf $resp41 | tr [a-z] [A-Z]`

	if [ "$resp41" = "$Sim" ]
	then
	    if ! [ -x /usr/local/bin/WhatsApp ]
	    then
	        clear
	        echo "Instalando WhatsApp-Desktop"
	        echo "***************************"
	        echo
	        echo "$senha1" | sudo -S apt-get install whatsapp-desktop -y
	        echo "$senha1" | sudo -S apt-get install -f -y --force-yes
	        echo
	        if [ -x /usr/local/bin/WhatsApp ]
	        then
	          echo "==> WhatsApp Desktop Está Instalado!"
	        else
	          echo "xxx> O WhatsApp Desktop Não Foi Instalado!"
	        fi
	    else
	        echo
	        echo "==> O WhatsApp Desktop Já Está Instalado!"
	    fi
	else
      echo
      echo "xxx> WhatsApp Desktop Não Será Instalado!"
      sleep 2	
	fi
    echo
    echo
    echo
    echo "Pressione ENTER para retornar ao Menu de Navegadores!"
    read
} #Fim: Instalação do WhatsApp Desktop


#Início: Menu de Pacotes Development
function PacotesDevelopment(){
  clear
  echo "*******************************************************************"
  echo "*                                                                 *"
  echo -e '*\e[1m                      Pacotes Development                        \e[m*'
  echo "*                                                                 *"
  echo "*******************************************************************"
  echo 
  echo "Esta Sessão Permite Realizar as Instalações dos Seguintes Pacotes:"
  echo
  echo -e '\e[31;1m [' 1 '] \e[m Code Blocks. ------------ (IDE para Desenvolvimento em C/C++)'
  echo -e '\e[31;1m [' 2 '] \e[m Geany. ------------------ (IDE para Desenvolvimento em C/C++)'
  echo -e '\e[31;1m [' 3 '] \e[m Eclipse. ---------------- (IDE para Desenvolvimento em Java)'
  echo -e '\e[31;1m [' 4 '] \e[m NetBeans. --------------- (IDE para Desenvolvimento em HTML5/CSS/JS)'
  echo -e '\e[31;1m [' 5 '] \e[m WorkBench/MySQL --------- (IDE para Desenvolvimento de Banco de Dados)'
  echo -e '\e[31;1m [' 6 '] \e[m PHP. -------------------- (Ferramentas para Desenvolvimento em PHP)'
  echo -e '\e[31;1m [' 7 '] \e[m Apache. ----------------- (Servidor)'
  echo -e '\e[31;1m [' 8 '] \e[m Python. ----------------- (Ferramentas para Desenvolvimento em Python)'
  echo -e '\e[31;1m [' 9 '] \e[m Git e Git-Cola. --------- (Versionador de Projetos)'
  echo -e '\e[31;1m [' 10 ']\e[m GCC e G++. -------------- (Compiladores)'
  echo -e '\e[31;1m [' 11 ']\e[m Sublime Text. ----------- (Editor de Código)'
  echo -e '\e[31;1m [' 12 ']\e[m Atom. ------------------- (Editor de Código)'
  echo
  echo -e '\e[31;1m [' V '] \e[m ... Voltar ao Menu Principal'
  echo -e '\e[31;1m [' S '] \e[m ... Sair do Script'
  echo
  echo
  echo -n "Escolha Uma Opção: "
} #Fim: Menu de Pacotes Development

#Início: Menu de Pacotes Development
function Development(){
  clear
  until (())
  do
      PacotesDevelopment normal
      read opcao
      opcao=`printf $opcao | tr [a-z] [A-Z]`
      echo
      echo
      case "$opcao" in
        1) CodeBlocks ;;
        2) Geany ;;
        3) Eclipse ;;
        4) NetBeans ;;
        5) WorkBench ;;
		6) PHP ;;
		7) Apache ;;
		8) Python ;;
        9) Git ;;
        10) GCC ;;
        11) Sublime_Text ;;
        12) Atom ;;
        V) Voltar ;;
        S) Sair ;;
        *) Invalida ;;
      esac   
  done
} #Fim: Menu de Pacotes Development


#Início: Instalação do CodeBlocks
function CodeBlocks(){
  	clear
  	echo "Instalando CodeBlocks"
  	echo "*********************"
  	sleep 1
  	echo ""
  	if ! [ -x /usr/bin/codeblocks ]
  	then
		echo "$senha1" | sudo -S apt-get install codeblocks -y
		echo "$senha1" | sudo -S apt-get install codeblocks-contrib -y
		echo "$senha1" | sudo -S apt-get install codeblocks-dbg -y
		echo
		if [ -x /usr/bin/codeblocks ]
		then
			echo
			echo "==> O CodeBlocks Foi Instalado Com Sucesso!"
			sleep 2
			echo
		else
			echo
			echo "xxx> O CodeBlocks Não Foi Instalado!"
			sleep 2
			echo
		fi
	else
		echo
		echo "==> O CodeBlocks Já Está Instalado!"
		echo
		sleep 2
	fi

	echo
	echo
	echo
	echo "Pressione ENTER Para Voltar ao Menu Development"
	read
} #Fim: Instalação do CodeBlocks


#Início: Instalação do Geany
function Geany(){
  	clear
    echo "Instalando Geany"
    echo "****************"
    sleep 1
    echo

    if ! [ -x /usr/bin/geany ]; then

    	echo "$senha1" | sudo -S apt-get install geany geany-plugins geany-plugin-overview font-manager -y
    	echo

		if [ -x /usr/bin/geany ]
		then
			echo
			echo "==> O Geany Foi Instalado Com Sucesso!"
			echo
			sleep 2
		else
			echo
			echo "xxx> O Geany Não Foi Instalado!"
			echo
			sleep 2
		fi
    else
    	echo
    	echo "==> O Geany Já Está Instalando!"
    	echo
    	sleep 2
    fi

	echo
	echo
	echo
	echo "Pressione ENTER Para Voltar ao Menu Development"
	read
} #Fim: Instalação do Geany


#Início: Instalação do Eclipse
function Eclipse(){
	clear
	echo "Instalando Eclipse"
	echo "******************"
	sleep 1
	echo ""

	if ! [ -x /usr/bin/eclipse ]; then

		echo "$senha1" | sudo -S apt-get install eclipse eclipse-jdt -y
		echo "$senha1" | sudo -S apt-get install eclipse-cdt eclipse-cdt-jni -y
		echo "$senha1" | sudo -S apt-get install eclipse-wtp eclipse-wtp-webtools -y
		echo "$senha1" | sudo -S apt-get install eclipse-pydev eclipse-pydev-data -y
		
		if [ -x /usr/bin/eclipse ]; then
			echo
			echo "==> O Eclipse Foi Instalado Com Sucesso!"
			echo
			sleep 2
		else
			echo
			echo "xxx> O Eclipse Não Foi Instalado!"
			echo
			sleep 2
		fi

	else
		echo
		echo "==> O Eclipse Já Está Instalando!"
		echo
		sleep 2
	fi

	echo
	echo
	echo
	echo "Pressione ENTER Para Voltar ao Menu Development"
	read
} #Fim: Instalação do Eclipse


#Início: Instalação do NetBeans
function NetBeans(){
	clear
	echo "Instalando NetBeans"
	echo "*******************"
	sleep 1
	echo ""

	if ! [ -x /usr/bin/netbeans ]; then

		echo "$senha1" | sudo -S apt-get install netbeans -y
		
		if [ -x /usr/bin/netbeans ]; then
			echo
			echo "==> O NetBeans Foi Instalado Com Sucesso!"
			echo
			sleep 2
		else
			echo
			echo "xxx> O NetBeans Não Foi Instalado!"
			echo
			sleep 2
		fi

	else
		echo
		echo "==> O NetBeans Já Está Instalando!"
		echo
		sleep 2
	fi

	echo
	echo
	echo
	echo "Pressione ENTER Para Voltar ao Menu Development"
	read
} #Fim: Instalação do NetBeans

:<<Teste
#Início: Instalação do WorkBench
function WorkBench(){


} #Fim: Instalação do WorkBench
Teste

#Início: Instalação do PHP
function PHP(){
	clear
    echo "Instalando PHP"
    echo "**************"
    sleep 1
    echo ""

    if ! [ -x '/usr/bin/php' ]; then
    	echo "$senha1" | sudo -S apt-get install php7.0-fpm php7.0-mysql php7.0-common php7.0-gd php7.0-json php7.0-cli php7.0-curl libapache2-mod-php7.0 -y
		
		if [ -x '/usr/bin/php' ]; then
			echo
			echo "==> O PHP Foi Instalado Com Sucesso!"
			echo
			sleep 2
		else
			echo
			echo "xxx> O PHP Não Foi Instalado!"
			echo
			sleep 2
		fi

	else
		echo
		echo "==> O PHP Já Está Instalando!"
		echo
		sleep 2
	fi

	echo
	echo
	echo
	echo "Pressione ENTER Para Voltar ao Menu Development"
	read
} #Fim: Instalação do PHP


#Início: Instalação do Servidor Apache
function Apache(){
	until (())
	do
		clear
		echo "               ***************************************************"
		echo "               *                                                 *"
		echo -e '               *               \e[1mInstalador do Apache\e[m              *'
		echo "               *                                                 *"
		echo "               ***************************************************"
		echo
		echo
		echo -e '\e[31;1m [' 1 '] \e[m Instalar Apache ----------------- (1ª Versão)'
		echo -e '\e[31;1m [' 2 '] \e[m Instalar apache2 ---------------- (2ª Versão)'
		echo
		echo -e '\e[31;1m [' V '] \e[m ... Voltar ao Menu de Pacotes Development'
		echo -e '\e[31;1m [' S '] \e[m ... Sair do Script'
		echo
		echo
		echo -n "Escolha Uma Opção: "
		read opcao
		opcao=`printf $opcao | tr [a-z] [A-Z]`
		case $opcao in
			1) 
				clear
				echo "Instalação do Apache"
				echo "********************"
				echo

				if ! [ -x /usr/bin/apache ]; then

					echo "$senha1" | sudo -S apt-get install apache -y
				
					if [ -x /usr/bin/apache ]; then
						echo
						echo -e '\e[32;1m==> Apache Instalado!\e[m'
						sleep 2
					else
						echo
						echo -e '\e[31;1mxxx> Apache Não Está Instalado!\e[m'
						sleep 2
					fi
				else
					echo
					echo "==> O Apache Já Está Instalando!"
					echo
					sleep 2
				fi

				echo
				echo
				echo
				echo "Pressione ENTER Para Voltar ao Menu Development"
				read
				;;

			2) 
				clear
				echo "Instalação do Apache2"
				echo "*********************"
				echo
				
				if ! [ -x /usr/sbin/apache2 ]; then

					echo "$senha1" | sudo -S apt-get install apache2 apache2-utils apache2-dev -y
					
					if [ -x /usr/sbin/apache2 ]; then
						echo
						echo -e '\e[32;1m==> Apache2 Instalado!\e[m'
						sleep 2
					else
						echo
						echo -e '\e[31;1mxxx> Apache2 Não Está Instalado!\e[m'
						sleep 2
					fi

				else
					echo
					echo "==> O Apache2 Já Está Instalando!"
					echo
					sleep 2
				fi

				echo
				echo
				echo
				echo "Pressione ENTER Para Voltar ao Menu Development"
				read
				;;

			V) Development ;;
			S) Sair ;;
			*) Desconhecida ;;
		esac
	done
} #Fim: Instalação do Servidor Apache


#Início: Python e Python-Jango
function Python(){
	until (( ))
	do
		clear
		echo "               ***************************************************"
		echo "               *                                                 *"
		echo -e '               *               \e[1mInstalador do Python\e[m              *'
		echo "               *                                                 *"
		echo "               ***************************************************"
		echo
		echo
		echo "Qual Versão do Python Você Deseja Instalar?"
		echo
		echo -e '\e[31;1m [ 1 ] \e[m Python & Python-Django. --------------- (Versão Antiga)'
		echo -e '\e[31;1m [ 2 ] \e[m python3 & Python3-Django. ------------- (Versão Recente)'
		echo
		echo -e '\e[31;1m [ V ] \e[m ... Voltar ao Menu de Pacotes Development'
		echo -e '\e[31;1m [ S ] \e[m ... Sair do Script'
		echo
		echo
		echo -n "Escolha Uma Opção: "
		read opcao
		opcao=`printf $opcao | tr [a-z] [A-Z]`

		case $opcao in
			1) 
				clear
				echo "Instalando Python & Python-Django" 
				echo "*********************************"
				echo
				echo "$senha1" | sudo -S apt-get install python -y
				echo "$senha1" | sudo -S apt-get install python-django -y	
			;;

			2) 
				clear
				echo "Instalando Python3 & Python3-Django" 
				echo "***********************************"
				echo
				echo "$senha1" | sudo -S apt-get install python3 -y
				echo "$senha1" | sudo -S apt-get install python3-django -y
			;;

			V) Development ;;
			S) Sair ;;
			*) Desconhecida ;;
		esac
	done

} #Fim: Python e Python-Jango


#Início: Instalação do Git e Git-Cola
function Git(){
	clear
	echo "Instalando Git & Git-Cola"
	echo "*************************"
	sleep 1
	echo

	if ! [ -x '/usr/bin/git' ]; then

	    echo "$senha1" | sudo -S apt-get install git -y
	    echo "$senha1" | sudo -S apt-get install git-hub -y
	    echo "$senha1" | sudo -S apt-get install git-cola -y

	    echo

	    #Git
		if [ -x '/usr/bin/git' ]; then
			echo "==> O Git Foi Instalado Com Sucesso!"
			echo
			sleep 1
		else
			echo "xxx> O Git Não Foi Instalado!"
			echo
			sleep 1
		fi

		#Git-Cola
		if [ -x '/usr/bin/git-cola' ]; then
			echo "==> O Git-Cola Foi Instalado Com Sucesso!"
			echo
			sleep 1
		else
			echo "xxx> O Git-Cola Não Foi Instalado!"
			echo
			sleep 1
		fi

		#Git-Hub
		if [ -x '/usr/bin/git-hub' ]; then
			echo "==> O Git-Hub Foi Instalado Com Sucesso!"
			echo
			sleep 1
		else
			echo "xxx> O Git-Hub Não Foi Instalado!"
			echo
			sleep 1
		fi

	else
		echo
		echo "==> O Git Já Está Instalando!"
		echo
		sleep 2

	fi

	echo
	echo
	echo
	echo "Pressione ENTER Para Voltar ao Menu Development"
	read
} #Fim: Instalação do Git e Git-Cola


#Início: Instalação do GCC e G++
function GCC(){
	clear
	echo "Instalando GCC & G++"
	echo "********************"
	sleep 1
	echo ""

	if ! [ -x '/usr/bin/gcc' ] && [ -x '/usr/bin/g++' ]; then

		echo "$senha1" | sudo -S apt-get install gcc -y
		echo "$senha1" | sudo -S apt-get install g++ -y

		echo

		if [ -x '/usr/bin/gcc' ]; then
			echo "==> O GCC Foi Instalado Com Sucesso!"
			echo
			sleep 1
		else
			echo "xxx> O GCC Não Foi Instalado!"
			echo
			sleep 1
		fi

		if [ -x '/usr/bin/g++' ]; then
			echo "==> O G++ Foi Instalado Com Sucesso!"
			echo
			sleep 1
		else
			echo "xxx> O G++ Não Foi Instalado!"
			echo
			sleep 1
		fi

	else
		echo
		if [ -x '/usr/bin/gcc' ]; then
			echo "==> O GCC Já Está Instalando!"
			echo
			sleep 1
		else
			echo "xxx> O GCC Não Está Instalando!"
			echo
			sleep 1
		fi

		if [ -x '/usr/bin/g++' ]; then
			echo "==> O G++ Já Está Instalando!"
			echo
			sleep 1
		else
			echo "xxx> O G++ Não Está Instalando!"
			echo
			sleep 1
		fi
	fi

	echo
	echo
	echo
	echo "Pressione ENTER Para Voltar ao Menu Development"
	read
} #Fim: Instalação do GCC e G++


#Início: Instalação do Sublime-Text
function Sublime_Text(){
	clear
	echo "Instalando Sublime-Text"
	echo "***********************"
	sleep 1
	echo

	if ! [ -x '/opt/sublime_text/sublime_text' ]; then

		echo "$senha1" | sudo -S apt-get install sublime-text -y

		if [ -x '/opt/sublime_text/sublime_text' ]; then

			echo "==> O Sublime-Text Foi Instalado Com Sucesso!"
			echo
			sleep 2
		else
			echo "xxx> O Sublime-Text Não Foi Instalado!"
			echo
			sleep 2
		fi

	else
		echo
		echo "==> O Sublime-Text Já Está Instalando!"
		echo
		sleep 2
	fi

	echo
	echo
	echo
	echo "Pressione ENTER Para Voltar ao Menu Development"
	read
} #Fim: Instalação do Sublime-Text


#Início: Instalação do Atom
function Atom(){
	clear
	echo "Instalando Atom"
	echo "***************"
	sleep 1
	echo ""

	if ! [ -x /usr/bin/atom ]; then

		echo "$senha1" | sudo -S apt-get install atom -y

		if [ -x /usr/bin/atom ]; then

			echo "==> O Atom Foi Instalado Com Sucesso!"
			echo
			sleep 2
		else
			echo "xxx> O Atom Não Foi Instalado!"
			echo
			sleep 2
		fi

	else
		echo
		echo "==> O Atom Já Está Instalando!"
		echo
		sleep 2

	fi

	echo
	echo
	echo
	echo "Pressione ENTER Para Voltar ao Menu Development"
	read
} #Fim: Instalação do Atom



#Início: Atualizador de Pacotes
#Atualiza Apenas os Pacotes Instalados
function AtualizarPacotes(){
  clear
  echo "Atualizando Todos os Pacotes Instalados"
  echo "***************************************"
  sleep 2
  echo
  echo "$senha1" | sudo -S apt-get update
  echo
  echo "$senha1" | sudo -S apt-get upgrade --fix-missing -y

  clear
  echo "*******************************************************"
  echo "* O Processo de Atualização dos Pacotes Foi Concluído! *"
  echo "*******************************************************"
  echo ""
  echo ""
  echo "Pressione ENTER para retornar ao Menu Principal ..."
  read
} #Fim: Atualizador de Pacotes


#Início: Atualizador do Sistema
#Aplica Todas as Atualizações Possíveis ao Sistema
function AtualizarSistema(){
  clear
  echo "Atualizando Todo o Sistema Operacional"
  echo "**************************************"
  sleep 2
  echo
  echo "$senha1" | sudo -S apt-get update
  echo
  echo "$senha1" | sudo -S apt-get upgrade --fix-missing -y
  echo
  echo "$senha1" | sudo -S apt-get dist-upgrade --fix-missing -y

  clear
  echo -e '                                    \e[31;1m' ATENÇÃO!' \e[m'
  echo "                                     ********"
  echo
  echo
  echo "Medida de Segurança!"
  echo "Após a atualização do Sistema Operacional (S.O) essa ação deve ser executada."
  echo "Ela atualizará toda a ordem de boot para evitar 'Kernel Panic' na próxima reinicialização."
  echo
  echo
  echo "Você Deseja Realizar Atualizações na Ordem de Boot do Grub? "
  echo -n "[Digite s/n]: "; read resp13
  resp13=`printf $resp13 | tr [a-z] [A-Z]`

  if [ "$resp13" = "$Sim" ] 
  then
  	echo
  	echo
  	echo "Você Escolheu Atualizar a Ordem de Boot!"
  	sleep 2
  	clear
  	echo "Atualizando a Ordem de Boot do Grub"
  	echo "***********************************"
  	sleep 1
  	echo
  	echo "$senha1" | sudo -S update-grub
  	echo
  else
  	echo
  	echo
  	echo "Você Escolheu Não Atualizar a Ordem de Boot!"
  	sleep 2
  	echo
  fi

  clear
  echo "*******************************************************"
  echo "* O Processo de Atualização do Sistema Foi Concluído! *"
  echo "*******************************************************"
  echo ""
  echo ""
  echo "Pressione ENTER para retornar ao Menu Principal ..."
  read
} #Fim: Atualizador do Sistema


#Início: Checklist de Pacotes 
function VerificarPacotes(){

  	for i in '.  ' '.. ' '...' ' ..' '  .' '   ' '.  ' '.. ' '...' ' ..' '  .' '   ' '.  ' '.. ' '...' ' ..' '  .' '   ' '.  ' '.. ' '...' ' ..' '  .' '   '
  	do
      	clear
      	echo "                         **************************************"
      	echo "                         *                                    *"
      	echo -e "                         *\e[1m       Verificando Pacotes          \e[m*"
      	echo "                         *                                    *" 
      	echo "                         **************************************"
      	echo
      	echo "Aguarde um Instante! [ $i ]"
     	sleep 0.2
  	done

  	clear
  	echo "                         **************************************"
  	echo "                         *                                    *"
  	echo -e "                         *\e[1m       Verificando Pacotes          \e[m*"
  	echo "                         *                                    *" 
  	echo "                         **************************************"
  	echo

  	echo
  	Teste1
  	echo
  	Teste2
  	echo
  	Teste3

  	echo
  	echo
  	echo

  	#Listagem de Avançada de Pacotes
  	echo "Você Deseja Realizar a Verificação Avançada dos Pacotes?"
  	echo -n "[Digite s/n]: "; read listpack
  	listpack=`printf $listpack | tr [a-z] [A-Z]`

  	if [ "$listpack" == "$Sim" ]
  	then
    	echo
      	echo "Você Escolheu Realizar a Verificação Avançada!"
      	sleep 2
      	echo
      	echo
      	VerificarPacotesAvancados
      	echo
  	else
      	echo
      	echo "Você escolheu não listar a verificação!"
      	sleep 2
      	echo
      	echo
  	fi
  	echo
  	echo
  	echo "Pressione ENTER para retornar ao Menu Principal ..."
  	read
} #Fim: Checklist de Pacotes 


#Início: Teste dos Pacotes Básicos
function Teste1(){
	if
	[ -x '/usr/bin/libreoffice' ] &&
	[ -d '/usr/share/fonts/truetype/msttcorefonts' ] && 
	[ -x '/usr/bin/brasero' ] && 
	[ -x '/usr/bin/vlc' ] && 
	[ -x '/usr/bin/parole' ] &&
	[ -x '/usr/bin/clipgrab' ] && 
	[ -x '/usr/bin/gimp' ] && 
	[ -x '/usr/bin/inkscape' ] && 
	[ -x '/usr/bin/kdenlive' ] &&
	[ -x '/usr/bin/obs' ] &&
	[ -x '/usr/bin/kazam' ] && 
	[ -x '/usr/bin/gparted-pkexec' ] && 
	[ -x '/usr/bin/gnome-disks' ] && 
	[ -x '/usr/bin/gnome-system-monitor' ] && 
	[ -x '/usr/bin/transmission-gtk' ] &&
	[ -x '/usr/bin/audacity' ] &&
	[ -x '/usr/bin/spotify' ] &&
	[ -x '/usr/bin/curlew' ] && 
	[ -x '/usr/bin/converseen' ]
	then
		echo
		echo -e "\e[32;1m==> Pacotes Básicos Estão Instalados!\e[m"
	else
		echo -e "xxx> \e[31;1mInfelizmente Houve um Problema! Os Pacotes Básicos Estão Instalados.\e[m"
		echo
	fi
} #Fim: Teste dos Pacotes Básicos


#Início: Teste dos Pacotes Avançados
function Teste2(){
	if
	[ -x '/usr/bin/firefox' ] || [ -x '/usr/bin/google-chrome-stable' ] || 
	[ -x '/usr/bin/dropbox' ] && 
	[ -x '/usr/local/bin/multisystem' ] &&
	[ -x '/usr/bin/multibootusb-pkexec' ] &&
	[ -x '/usr/bin/virtualbox' ] && 
	[ -x '/usr/games/steam' ] && 
	[ -x '/usr/bin/playonlinux' ] &&
	[ -x '/usr/bin/wine' ] &&
	[ -x '/usr/bin/blender' ] && 
	[ -x '/usr/bin/grub-customizer' ] &&
	[ -x '/usr/sbin/synaptic' ] &&
	[ -x '/usr/bin/stoq' ] &&
	[ -x '/usr/bin/bibletime' ] &&
	[ -x '/usr/bin/xiphos' ] &&
	[ -x '/usr/bin/goldendict' ]
	then
		echo
	  	echo -e "\e[32;1m==> Pacotes Avançados Estão Instalados!\e[m"
	else
		echo
	  	echo -e "\e[31;1mxxx> Alguns Pacotes Avançados Não Estão Instalados!\e[m"
	fi
} #Fim: Teste dos Pacotes Avançados


#Início: Teste dos Pacotes Development
function Teste3(){
	if
	[ -x '/usr/bin/codeblocks' ] &&
	[ -x '/usr/bin/geany' ] &&
	[ -x '/usr/bin/eclipse' ] &&
	[ -x '/usr/bin/netbeans' ] &&
	[ -x '/usr/bin/php' ] &&
	[ -x '/usr/sbin/apache' ] || [ -x '/usr/sbin/apache2' ] &&
	[ -x '/usr/bin/git' ] &&
	[ -x '/usr/bin/gcc' ] &&
	[ -x '/usr/bin/g++' ] &&
	[ -x '/opt/sublime_text/sublime_text' ] &&
	[ -x '/usr/bin/atom' ]
	then
		echo
		echo -e "\e[32;1m==> Pacotes Development Estão Instalados!\e[m" 
	else
		echo
		echo -e "\e[31;1mxxx> Alguns Pacotes Development Não Estão Instalados!\e[m"
	fi
} #Fim: Teste dos Pacotes Development


function VerificarPacotesAvancados(){
	for i in  '.  ' '.. ' '...' ' ..' '  .' '   ' '.  ' '.. ' '...' ' ..' '  .' '   ' '.  ' '.. ' '...' ' ..' '  .' '   ' '.  ' '.. ' '...' ' ..' '  .' '   '
    do
      	clear
      	echo "            *************************************************************"
      	echo "            *                                                           *"
      	echo -e "            *\e[1m              Verificação Avançada de Pacotes              \e[m*"
      	echo "            *                                                           *" 
      	echo "            *************************************************************"
      	echo
      	echo "Aguarde um Instante! [ $i ]"
      	sleep 0.2
    done

	clear
	clear
	echo "            *************************************************************"
	echo "            *                                                           *"
	echo -e "            *\e[1m              Verificação Avançada de Pacotes              \e[m*"
	echo "            *                                                           *" 
	echo "            *************************************************************"
	echo

	rm -Rf /home/$USER/.ListPack.txt
	touch /home/$USER/.ListPack.txt

	# Linstando Pacotes Básicos
	echo -e "\e[1mPacotes Básicos:\e[m" >> /home/$USER/.ListPack.txt
	echo "****************" >> /home/$USER/.ListPack.txt

	# Testando se o Tema Papirus foi instalado
	if [ -d /usr/share/icons/Papirus ]
	then
		echo "==> Tema Papirus está instalado! ------------ `dpkg -s papirus-icon-theme | grep ^V --color=never | cut -d+ -f1`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Tema Papirus não foi instalado!" >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Tema Arc foi instalado
	if [ -d /usr/share/themes/Arc ]
	then
		echo "==> Tema Arc está instalado! ---------------- `dpkg -s arc-theme | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Tema Arc não foi instalado!" >> /home/$USER/.ListPack.txt
	fi

	# Testando se o LibreOffice foi instalado
	if [ -x /usr/bin/libreoffice ]
	then
		echo -n "==> LibreOffice está instalado! ------------- " >> /home/$USER/.ListPack.txt
		echo "Version: `libreoffice --version | cut -c13-`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! O LibreOffice não foi instalado." >> /home/$USER/.ListPack.txt
	fi

	# Testando se o msttcorefonts foi instalado
	if [ -d /usr/share/fonts/truetype/msttcorefonts ]
	then
		echo "==> Fontes da Microsoft estão instaladas!" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! As Fontes da Microsoft não foram instaladas." >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Brasero foi instalado
	if [ -x /usr/bin/brasero ]
	then
		echo "==> Brasero está instalado! ----------------- `dpkg -s brasero | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! O Brasero não foi instalado." >> /home/$USER/.ListPack.txt
	fi

	# Testando se o VLC foi instalado
	if [ -x /usr/bin/vlc ]
	then
		echo "==> VLC está instalado! --------------------- `dpkg -s vlc | grep ^V --color=never | cut -d+ -f1`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! O VLC não foi instalado." >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Parole foi instalado
	if [ -x /usr/bin/parole ]
	then
		echo "==> Parole está instalado! ------------------ `dpkg -s parole | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! O Parole não foi instalado." >> /home/$USER/.ListPack.txt
	fi

	# Testando se o ClipGrab foi instalado
	if [ -x /usr/bin/clipgrab ]
	then
		echo "==> ClipGrab está instalado! ---------------- `dpkg -s clipgrab | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! O ClipGrab não foi instalado." >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Gimp foi instalado
	if [ -x /usr/bin/gimp ]
	then
		echo "==> Gimp está instalado! -------------------- `dpkg -s gimp | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! O Gimp não foi instalado." >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Inkscape foi instalado
	if [ -x /usr/bin/inkscape ]
	then
		echo "==> Inkscape está instalado! ---------------- `dpkg -s inkscape | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! O Inkscape não foi instalado." >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Kdenlive foi instalado
	if [ -x /usr/bin/kdenlive ]
	then
		echo "==> Kdenlive está instalado! ---------------- `dpkg -s kdenlive | grep ^V --color=never | cut -d+ -f1`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! O Kdenlive não foi instalado." >> /home/$USER/.ListPack.txt
	fi

	# Testando se o OBS-Studio foi instalado
	if [ -x /usr/bin/obs ]
	then
		echo "==> OBS-Studio está instalado! -------------- `dpkg -s obs-studio | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! O OBS-Studio não foi instalado." >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Kazam foi instalado
	if [ -x /usr/bin/kazam ]
	then
		echo "==> Kazam está instalado! ------------------- `dpkg -s kazam | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! O Kazam não foi instalado." >> /home/$USER/.ListPack.txt
	fi

	# Testando se o GParted foi instalado
	if [ -x /usr/bin/gparted-pkexec ]
	then
		echo "==> GParted está instalado! ----------------- `dpkg -s gparted | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! O GParted não foi instalado." >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Gnome-Disks foi instalado
	if [ -x /usr/bin/gnome-disks ]
	then
		echo "==> Gnome-Disks está instalado! ------------- `dpkg -s gnome-disk-utility | grep ^V --color=never | cut -c1-19`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! O Gnome-Disks não foi instalado." >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Monitor do Sistema do Gnome foi instalado
	if [ -x /usr/bin/gnome-system-monitor ]
	then
		echo "==> Monitor do Sistema está instalado! ------ `dpkg -s gnome-system-monitor | grep ^V --color=never | cut -c1-17`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! O Monitor do Sistema não foi instalado." >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Converseen foi instalado
	if [ -x /usr/bin/converseen ]
	then
		echo "==> Converseen está instalado! -------------- `dpkg -s converseen | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! O Converseen não foi instalado." >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Transmission foi instalado
	if [ -x /usr/bin/transmission-gtk ]
	then
		echo "==> Transmission está instalado! ------------ `dpkg -s transmission-gtk | grep ^V --color=never | cut -c1-15`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! O Transmission não foi instalado." >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Audacity foi instalado
	if [ -x /usr/bin/audacity ]
	then
		echo "==> Audacity está instalado! ---------------- `dpkg -s audacity | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! O Audacity não foi instalado." >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Spotify foi instalado
	if [ -x /usr/bin/spotify ]
	then
		echo "==> Spotify está instalado! ----------------- `dpkg -s spotify-client | grep ^Ver --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! O Spotify não foi instalado." >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Curlew foi instalado
	if [ -x /usr/bin/curlew ]
	then
		echo "==> Curlew está instalado! ------------------ `dpkg -s curlew | grep ^Ver --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> Houve um problema! O Curlew não foi instalado." >> /home/$USER/.ListPack.txt
	fi

	echo "" >> /home/$USER/.ListPack.txt

	# Listando Pacotes Avançados
	echo -e "\e[1mPacotes Avançados:\e[m" >> /home/$USER/.ListPack.txt
	echo "******************" >> /home/$USER/.ListPack.txt

	# Testando se o Firefox foi instalado
	if [ -x /usr/bin/firefox ]
	then
		echo "==> Firefox está instalado! ----------------- `dpkg -s firefox | grep Version --color=never | cut -d+ -f1`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Firefox não foi instalado!" >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Dropbox foi instalado
	if [ -x /usr/bin/dropbox ]
	then
		echo "==> DropBox está instalado! ----------------- Version: `cat /home/$USER/.dropbox-dist/VERSION`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O DropBox não foi instalado!" >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Multissystem foi instalado
	if [ -x /usr/local/bin/multisystem ]
	then
		echo "==> Multisystem está instalado! ------------- `dpkg -s multisystem | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Multisystem não foi instalado!" >> /home/$USER/.ListPack.txt
	fi

	#Testando se o MultiBootUSB foi instalado
	if [ -x /usr/bin/multibootusb-pkexec ]
	then
	 	echo "==> MultiBootUSB está instalado! ------------ `dpkg -s python3-multibootusb | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
	  	echo "xxx> O MultiBootUSB não foi instalado!" >> /home/$USER/.ListPack.txt
	fi

	# Testando se o VirtualBox foi instalado
	if [ -x /usr/bin/virtualbox ]
	then
		echo "==> VirtualBox está instalado! -------------- `dpkg -s virtualbox | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O VirtualBox não foi instalado!" >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Steam foi instalado
	if [ -x /usr/games/steam ]
	then
		echo "==> Steam está instalado! ------------------- `dpkg -s steam | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Steam não foi instalado!" >> /home/$USER/.ListPack.txt
	fi

	# Testando se o PlayOnLinux foi instalado
	if [ -x /usr/bin/playonlinux ]
	then
		echo "==> PlayOnLinux está instalado! ------------- `dpkg -s playonlinux | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O PlayOnLinux não foi instalado!" >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Wine foi instalado
	if [ -x /usr/bin/wine ]
	then
		echo "==> Wine está instalado! -------------------- `dpkg -s wine | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Wine não foi instalado!" >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Blender foi instalado
	if [ -x /usr/bin/blender ]
	then
		echo "==> Blender está instalado! ----------------- `dpkg -s blender | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Blender não foi instalado!" >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Grub-Customizer foi instalado
	if [ -x /usr/bin/grub-customizer ]
	then
		echo "==> Grub-Customizer está instalado! --------- `dpkg -s grub-customizer | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Grub-Customizer não foi instalado!" >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Synaptic foi instalado
	if [ -x /usr/sbin/synaptic ]
	then
		echo "==> Synaptic está instalado! ---------------- `dpkg -s synaptic | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Synaptic não foi instalado!" >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Stoq foi instalado
	if [ -x /usr/bin/stoq ]
	then
		echo "==> Stoq está instalado! -------------------- `dpkg -s stoq | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Stoq não foi instalado!" >> /home/$USER/.ListPack.txt
	fi

	# Testando se o BibleTime foi instalado
	if [ -x /usr/bin/bibletime ]
	then
		echo "==> BibleTime está instalado! --------------- `dpkg -s bibletime | grep ^V --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> A BibleTime não foi instalado!" >> /home/$USER/.ListPack.txt
	fi

	# Testando se o Xiphos foi instalado
	if [ -x /usr/bin/xiphos ]
	then
		echo "==> Xiphos está instalado! ------------------ `dpkg -s xiphos | grep ^V --color=never | cut -d+ -f1`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> A Xiphos não foi instalado!" >> /home/$USER/.ListPack.txt
	fi

	if [ -x '/usr/bin/goldendict' ]
	then
	  	echo -n "==> Dicionário GoldenDict está instalado! --- " >> /home/$USER/.ListPack.txt
	  	echo "`dpkg -s goldendict | grep ^Version --color=never | cut -d~ -f1`" >> /home/$USER/.ListPack.txt
	else
	  	echo "xxx> O Dicionário GoldenDict não foi instalado!" >> /home/$USER/.ListPack.txt
	fi

	echo "" >> /home/$USER/.ListPack.txt

	#Pacotes Development
	echo -e "\e[1mPacotes Development:\e[m" >> /home/$USER/.ListPack.txt
	echo "********************" >> /home/$USER/.ListPack.txt


	# Testando se o Code Blocks foi instalado
	if [ -x '/usr/bin/codeblocks' ]
	then
		echo "==> Code Blocks está instalado! ------------- `dpkg -s codeblocks | grep ^Version --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Code Blocks não foi instalado!" >> /home/$USER/.ListPack.txt			
	fi

	# Testando se o Geany foi instalado
	if [ -x '/usr/bin/geany' ]
	then
		echo "==> Geany está instalado! ------------------- `dpkg -s geany | grep ^Version --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Geany não foi instalado!" >> /home/$USER/.ListPack.txt		
	fi

	# Testando se o Eclipse foi instalado
	if [ -x '/usr/bin/eclise' ]
	then
		echo "==> Eclipse está instalado! ----------------- `dpkg -s eclipse | grep ^Version --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Eclipse não foi instalado!" >> /home/$USER/.ListPack.txt		
	fi

	# Testando se o Netbeans foi instalado
	if [ -x '/usr/bin/netbeans' ]
	then
		echo "==> Netbeans está instalado! ---------------- `dpkg -s netbeans | grep ^Version --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Netbeans não foi instalado!" >> /home/$USER/.ListPack.txt		
	fi

	# Testando se o PHP foi instalado
	if [ -x '/usr/bin/php' ]
	then
		echo "==> PHP está instalado! --------------------- `dpkg -s php | grep ^Version --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O PHP não foi instalado!" >> /home/$USER/.ListPack.txt			
	fi

	# Testando se o Apache foi instalado
	if [ -x '/usr/sbin/apache' ] || [ -x '/usr/sbin/apache2' ]
	then
		echo "==> Apache está instalado! ------------------ `dpkg -s apache | grep ^Version --color=never || dpkg -s apache2 | grep ^Version --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Apache não foi instalado!"	>> /home/$USER/.ListPack.txt		
	fi

	# Testando se o Git foi instalado
	if [ -x '/usr/bin/git' ]
	then
		echo "==> Git está instalado! --------------------- `dpkg -s git | grep ^Version --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Git não foi instalado!" >> /home/$USER/.ListPack.txt		
	fi

	# Testando se o Git-Cola foi instalado
	if [ -x '/usr/bin/git-cola' ]
	then
		echo "==> Git-Cola está instalado! ---------------- `dpkg -s git-cola | grep ^Version --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Git-Cola não foi instalado!" >> /home/$USER/.ListPack.txt		
	fi

	# Testando se o Git-Hub foi instalado
	if [ -x '/usr/bin/git-hub' ]
	then
		echo "==> Git-Hub está instalado! ----------------- `dpkg -s git-hub | grep ^Version --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Git-Hub não foi instalado!" >> /home/$USER/.ListPack.txt			
	fi

	# Testando se o GCC foi instalado
	if [ -x '/usr/bin/gcc' ]
	then
		echo "==> GCC está instalado! --------------------- `dpkg -s gcc | grep ^Version --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O GCC não foi instalado!" >> /home/$USER/.ListPack.txt		
	fi

	# Testando se o G++ foi instalado
	if [ -x '/usr/bin/g++' ]
	then
		echo "==> G++ está instalado! --------------------- `dpkg -s g++ | grep ^Version --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O G++ não foi instalado!" >> /home/$USER/.ListPack.txt		
	fi		
	echo

	# Testando se o Sublime-Text foi instalado
	if [ -x '/opt/sublime_text/sublime_text' ]
	then
		echo "==> Sublime-Text está instalado! ------------ `dpkg -s sublime-text | grep ^Version --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Sublime-Text não foi instalado!" >> /home/$USER/.ListPack.txt		
	fi		
	echo

	# Testando se o Atom foi instalado
	if [ -x '/usr/bin/atom' ]
	then
		echo "==> Atom está instalado! -------------------- `dpkg -s atom | grep ^Version --color=never`" >> /home/$USER/.ListPack.txt
	else
		echo "xxx> O Atom não foi instalado!" >> /home/$USER/.ListPack.txt
	fi		
	echo

	clear
	cat /home/$USER/.ListPack.txt | more
}


#Início: Limpador do Sistema
function LimparSistema(){
  clear
  echo "************************************************************************"
  echo "*                                                                      *"
  echo "*                 Limpador de Arquivos Desnecessários                  *"
  echo "*                                                                      *"
  echo "************************************************************************"
  echo
  echo
  echo -e '\e[31;1m 'ATENÇÃO!' \e[m'
  echo " ********"
  echo
  echo "Esta função será executada como Super Usuário!"
  echo "Ela irá remover definitivamente todos os arquivos desnecessários do sistema."
  echo
  echo "Serão apagados:"
  echo
  echo "==> Arquivos da Lixeira;"
  echo "==> Arquivos Temporários;"
  echo "==> Pacotes Duplicados;"
  echo "==> Cache desnecessário do APT;"
  echo "==> Pacotes Quebrados ou Obsoletos;"
  echo "==> Kernels Inativos."
  echo
  echo
  echo "Você realmente deseja realizar esta ação?"
  echo -n "[Digite s/n]: "; read resp1
  resp1=`printf $resp1 | tr [a-z] [A-Z]`

  if [ "$resp1" = "$Sim" ]
  then
      echo
      echo "Você escolheu realizar a limpeza do sistema!"
      sleep 2
      echo
      echo
      
      clear
      echo "Limpando a Lixeira"
      echo "******************"
      sleep 2
      echo ""
      echo "$senha1" | sudo -S rm -rf /home/$USER/.local/share/Trash/files/*
      echo "Ok"
      echo ""
      
      echo "Limpando a Pasta de Aquivos Temporários"
      echo "***************************************"
      sleep 2
      echo ""
      echo "$senha1" | sudo -S rm -rf /var/tmp/*
      echo "Ok"
      echo ""
      
      echo "Limpando Caches do APT em Desuso"
      echo "********************************"
      sleep 2
      echo ""
      echo "$senha1" | sudo -S apt-get clean -y
      echo "$senha1" | sudo -S apt-get autoclean -y
      echo "Ok"
      echo ""

      echo "Removendo Programas Obsoletos"
      echo "*****************************"
      sleep 2
      echo ""
      echo "$senha1" | sudo -S apt-get autoremove -y
      echo "Ok"
      echo
      sleep 2

      clear
      echo "Limpeza Concluída!"
      echo "******************"
      echo
      echo
      echo -e '\e[31;1m'ATENÇÃO!'\e[m'
      echo "********"
      echo
      echo -e 'Se algum kernel foi removido, realize a opção \e[31;1m'[7]'\e[m do Menu Principal!'
      echo "Ela atualizará toda a ordem de boot para evitar 'Kernel Panic' na próxima reinicialização."
  else
      echo
      echo "Você escolheu não realizar a limpeza do sistema!"
      sleep 2
  fi
  echo
  echo
  echo
  echo
  echo "Pressione ENTER para retornar ao Menu Principal ..."
  read _ENTER
} #Fim: Limpador do Sistema


#Início: Atualiza a Ordem do Grub
function AtualizarGrub(){
  clear
  echo "Atualizando Alterações no Grub"
  echo "******************************"
  sleep 2
  echo ""
  echo "$senha1" | sudo -S update-grub
  echo ""
  echo ""
  echo "Pressione ENTER para retornar ao Menu Principal ..."
  read _ENTER
} #Fim: Atualiza a Ordem do Grub


#Início: Correção de Pacotes Quebrados ou Dependências
function CorrigirDependencias(){
  clear
  echo "Verificando e Corrigindo Pacotes Quebrados e com Dependências"
  echo "*************************************************************"
  sleep 2
  echo ""
  echo "$senha1" | sudo -S dpkg --configure -a
  echo "$senha1" | sudo -S apt-get install -f -y --force-yes
  echo ""
  echo ""
  echo "Pressione ENTER para retornar ao Menu Principal ..."
  read _ENTER
} #Fim: Correção de Pacotes Quebrados ou Dependências


#Início: Desinstalador de Pacotes
function Desinstalar() {
	until (( ))
	do
		clear
		echo "               ************************************************************"
		echo "               *                                                          *"
		echo -e "               *\e[1m                Desinstalação de Pacotes                  \e[m*"
		echo "               *                                                          *"
		echo "               ************************************************************"
		echo
		echo
		echo -e '\e[31;1mATENÇÃO!\e[m'
		echo
		echo "Você será o único responsável por quaisquer danos provinientes da desinstalação deste Pacote!"
		echo "Execute esta ação com responsabilidade!"
		echo
		echo
		echo "Você Deseja Continuar? "
		echo -n "[Digite s/n]: "
		read opcao
		opcao=`printf $opcao | tr [a-z] [A-Z]`

		case $opcao in
			S)	
				echo
				echo
				echo -n "Digite Corretamente o Nome do Pacote a Ser Desinstalado: "
				read Pack
				echo
				echo
				sudo apt-get remove $Pack -y && sudo apt-get autoremove -y
			;;

			N) _menu ;;
			*) Desconhecida ;;
		esac
	done
} #Fim: Desinstalador de Pacotes


#Início: Informações Sobre o Script
function InformacoesScript(){

	clear

	rm -Rf /home/$USER/.ListInfo.txt
	touch /home/$USER/.ListInfo.txt

	echo "           ************************************************************************" >> /home/$USER/.ListInfo.txt
	echo "           *                                                                      *" >> /home/$USER/.ListInfo.txt
	echo -e "           *\e[1m                       INFORMAÇÕES DO BRUTUS                          \e[m*" >> /home/$USER/.ListInfo.txt
	echo "           *                                                                      *" >> /home/$USER/.ListInfo.txt
	echo "           ************************************************************************" >> /home/$USER/.ListInfo.txt
	echo "" >> /home/$USER/.ListInfo.txt
	echo "" >> /home/$USER/.ListInfo.txt
	echo "O Brutus é um Script de Pós-Instalação de Distros Baseadas no 'Ubuntu'." >> /home/$USER/.ListInfo.txt
	echo "Ele Possui a Função de Instalar e/ou Atualizar:" >> /home/$USER/.ListInfo.txt
	echo "" >> /home/$USER/.ListInfo.txt
	echo "" >> /home/$USER/.ListInfo.txt
	echo "a) O Pacote Básico:" >> /home/$USER/.ListInfo.txt
	echo "*******************" >> /home/$USER/.ListInfo.txt
	echo "==> Tema Papirus e Tema Arc          ==> OBS-Studio" >> /home/$USER/.ListInfo.txt
	echo "==> Monitor do Sistema               ==> Kazam" >> /home/$USER/.ListInfo.txt
	echo "==> GParted                          ==> Kdenlive" >> /home/$USER/.ListInfo.txt
	echo "==> Gnome-Disks                      ==> Gimp" >> /home/$USER/.ListInfo.txt
	echo "==> Brasero                          ==> Inkscape" >> /home/$USER/.ListInfo.txt
	echo "==> Audacity                         ==> ClipGrab" >> /home/$USER/.ListInfo.txt
	echo "==> Parole                           ==> Spotify" >> /home/$USER/.ListInfo.txt
	echo "==> VLC                              ==> Transmission" >> /home/$USER/.ListInfo.txt
	echo "==> Curlew                           ==> Pacote de Fontes da Microsoft" >> /home/$USER/.ListInfo.txt
	echo "==> Converseen" >> /home/$USER/.ListInfo.txt
	echo "==> LibreOffice, Pacote de Tradução e Tema de Ícones" >> /home/$USER/.ListInfo.txt
	echo "" >> /home/$USER/.ListInfo.txt
	echo "" >> /home/$USER/.ListInfo.txt
	echo "b) O Pacote Avançado:" >> /home/$USER/.ListInfo.txt
	echo "*********************" >> /home/$USER/.ListInfo.txt
	echo "==> Navegadores" >> /home/$USER/.ListInfo.txt
	echo "==> DropBox                          ==> Blender" >> /home/$USER/.ListInfo.txt
	echo "==> Multisystem                      ==> MultiBootUSB" >> /home/$USER/.ListInfo.txt
	echo "==> VirtualBox                       ==> Synaptic" >> /home/$USER/.ListInfo.txt
	echo "==> Steam                            ==> Stoq" >> /home/$USER/.ListInfo.txt
	echo "==> PlayOnLinux                      ==> Wine" >> /home/$USER/.ListInfo.txt
	echo "==> Dicionário GoldenDict            ==> Grub Customizer" >> /home/$USER/.ListInfo.txt
	echo "==> BibleTime                        ==> Xiphos" >> /home/$USER/.ListInfo.txt
	echo "" >> /home/$USER/.ListInfo.txt
	echo "" >> /home/$USER/.ListInfo.txt
	echo "c) O Pacote Development:" >> /home/$USER/.ListInfo.txt
	echo "************************" >> /home/$USER/.ListInfo.txt
	echo "==> CodeBlocks                       ==> Apache" >> /home/$USER/.ListInfo.txt
	echo "==> Geany                            ==> PHP" >> /home/$USER/.ListInfo.txt
	echo "==> NetBeans                         ==> Python" >> /home/$USER/.ListInfo.txt
	echo "==> Eclipse                          ==> GCC e G++" >> /home/$USER/.ListInfo.txt
	echo "==> WorkBench e MySQL                ==> Atom" >> /home/$USER/.ListInfo.txt
	echo "==> Git, Git-Cola e GitHub           ==> Sublime-Text" >> /home/$USER/.ListInfo.txt
	echo "" >> /home/$USER/.ListInfo.txt
	echo "" >> /home/$USER/.ListInfo.txt
	echo "d) Extras:" >> /home/$USER/.ListInfo.txt
	echo "**********" >> /home/$USER/.ListInfo.txt
	echo "==> Atualizar Todos os Pacotes Instalados;" >> /home/$USER/.ListInfo.txt
	echo "==> Atualiza Todo o Sistema;" >> /home/$USER/.ListInfo.txt
	echo "==> Verificar e Listar Pacotes Foram ou Não Instalados;" >> /home/$USER/.ListInfo.txt
	echo "==> Corrigir Dependências e Pacotes Quebrados;" >> /home/$USER/.ListInfo.txt
	echo "==> Realizar Limpeza do Sistema como: Cache do APT, Lixeira, Arquivos Temporários e Pacotes e Kernels Obsoletos;" >> /home/$USER/.ListInfo.txt
	echo "==> Atualizar a Ordem e Alterações de Boot do Grub." >> /home/$USER/.ListInfo.txt
	echo "" >> /home/$USER/.ListInfo.txt
	echo "" >> /home/$USER/.ListInfo.txt
	echo "Dicas para Facilitar a Utilização:" >> /home/$USER/.ListInfo.txt
	echo "**********************************" >> /home/$USER/.ListInfo.txt
	echo "Este simbolo '==>' significa que o pacote está instalado." >> /home/$USER/.ListInfo.txt
	echo "Este simbolo 'xxx>' significa que não está instalado." >> /home/$USER/.ListInfo.txt
	echo "Para facilitar a visualização deixe o terminal em 95x30 (95 colunas por 30 linhas)." >> /home/$USER/.ListInfo.txt
	echo "" >> /home/$USER/.ListInfo.txt
	echo "" >> /home/$USER/.ListInfo.txt
	echo "Se houver dúvidas ou sugestões, contate-nos pelo E-mail: luciobrito2012@gmail.com" >> /home/$USER/.ListInfo.txt
	echo "Assista também nossos vídeos no You Tube acessando o Canal Live Informática." >> /home/$USER/.ListInfo.txt

	clear
	cat /home/$USER/.ListInfo.txt | more
	rm -Rf /home/$USER/.ListInfo.txt

	echo
	echo
	echo
	echo "Pressione ENTER para retornar ao Menu Principal ..."
	read _ENTER
} #Fim: Informações Sobre o Script


#Início: Voltar ao Menu Principal
Voltar(){
  _menu
} #Fim: Voltar ao Menu Principal


#Início: Voltar ao Menu de Pacotes Avançados
Voltar1(){
  InstalarPacotesAvancados
} #Fim: Voltar ao Menu de Pacotes Avançados


#Início: Sair do Script
function Sair(){
    clear
    for((i = 9; i >= 0; i--))
    do
	    clear
	    echo "             **********************************************************"
	    echo -e '             *\e[1m                       Creditos:                        \e[m*'
	    echo "             *                                                        *"
	    echo "             *   Este Script de Instalação, Atualização e Checklist   *"
	    echo "             *        de Pacotes foi Criado Por LUCIANO BRITO.        *"
	    echo "             *                                                        *"
	    echo "             **********************************************************"
	    echo
	    echo
	    echo "Contate-nos pelo E-mail: luciobrito2012@gmail.com"
	    echo "Assista também nossos vídeos no You Tube acessando o Canal Live Informática."
	    echo
	    echo
	    echo -e '\e[32;1mObrigado por utilizar nosso Script!\e[m'
	    echo
	    echo
	    echo
	    echo -e "\e[1mEste Script Será Finalizado em\e[m \e[31;1m$i\e[m \e[1mSegundos...\e[m"
	    sleep 1
    done
    exit
} #Fim: Sair do Script


# Menu Principal
_menu

exit
