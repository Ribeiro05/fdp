#!/bin/bash
clear
function CONFIP(){
MENU=$( dialog --stdout	--ok-label Continuar --cancel-label Cancelar	\
	--title 'Configurar IP'						\
	--inputbox 'Digite o nome da interface que deseja configurar :'	\
	0 0)
DIG=$?
if [ $DIG == 0 ]; then 
IP=$( dialog --stdout --ok-label Continuar --cancel-label Cancelar	\
--title 'Configurar IP'							\
--inputbox 'Digite o IP/MÁSCARA  que deseja inserir : '			\
0 0)
	ip addr add $IP dev $MENU
 	elif [ $DIG == 1 ]; then 
	ip add dhclient $MENU
	QNT
fi
}
#-------------------------------------------------------------------------#
function REMIP(){
REM=$( dialog --stdout	 					\
--title 'Remover IP'						\
--inputbox 'Qual o nome da interface que deseja remover:'	\
0 0)
MOV=$( dialog --stdout						\
--title 'Remover IP'						\
--inputbox 'Qual o IP que deseja remover: '			\
0 0)

DIG=$?
if [ $DIG == 0 ]; then 
	ip addr del $MOV dev $REM
	QNT
fi
}
#---------------------------------------------------------------------#
#function CONFIGAT(){
#GAT=$( dialog --stdout --ok-label Continuar --cancel-label Cancelar 	\
#	--title 'Configurar Gateway'					\
#	--inputbox 'Digite o Gateway desejado : '			\
#	0 0)
#DIG=$?
#if [ $DIG == 0 ]; then 
#	ip route add default via $GAT metric 1
#fi
#}
#-------------------------------------------------------------------#
function ADP(){
AT=$( dialog --stdout --oklabel Continuar --cancel-label Cancelar	\
	--title 'Ativando ou desativando a placa'			\
	--menu 'Escolha a opção desejada: '				\
	0 0 0								\
	AT 'Ativar a interface'						\
	DE 'Desativar interface'					\
	VO 'Voltar')
}
##########################MENU##################################
function QNT(){
REDE=$( dialog --stdout					\
	--title 'Gerenciamento de Redes'		\
	--menu 'Escolha a opção desejada: '		\
	0 0 0						\
	1 'Configurar IP expecificando a mascara'	\
	2 'Configurar Gateway'				\
	3 'Remover IP'					\
	4 'Ativando ou desativando a placa'		\
	5 'Voltar')
case $REDE in 
	1) CONFIP ;;
	2) CONFIGAT ;;
 	3) REMIP ;;
	4) ADP ;;
	5)  QNT ;;
esac
}
QNT
