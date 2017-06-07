#!/bin/bash
clear
FL(){
USUARIO=admin
SENHA=admin
#-----------------------------------------------------------------------#
USER=$(dialog --stdout							\
	--title 'Login'							\
	--inputbox "digite o seu usuário:"				\
	0 0)
if [ $USER == $USUARIO ]; then 
	SE=$( dialog --stdout						\
	--title 'Login'							\
	--inputbox 'Digite a senha: '					\
	0 0)

	if [ $SE == $SENHA ]; then 
		bash MENUZAUM.sh
	else
		dialog --stdout  --infobox "Senha Login" 0 0
	fi
fi
}
#________________________________________________________________________#
SAIR(){
EXIT=$( dialog --stdout							\
	--title 'Saindo'						\
	--infobox 'Finalizado...'					\
	0 0)
}
#-----------------------------------------------------------------------#
function DIG(){
MENU=$( dialog --stdout 						\
	--title ' Acesso ao Projeto Omega '				\
	--menu 	'Escolha uma opção:'					\
	0 0 0								\
	1 'Fazer login'							\
	2 'Sair')
case $MENU in
	1) FL ;;
	2) SAIR ;;
esac
}
DIG
