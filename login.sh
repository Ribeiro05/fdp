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
CRUS(){
NOME=$( dialog --stdout 						\
	--title 'Criação de usuario'					\
	--inputbox 'Digite o nome que deseja utilizar:'			\
	0 0)
VERIFY $NOME
SENHA=$( dialog --stdout 						\
	--title 'Criação de usuario'					\
	--inputbox 'Digite a senha que deseja utilizar:'		\
	0 0)
VERIFY $SENHA
CONF_SENHA=$( dialog --stdout 						\
	--title 'Criação de usuario'					\
	--inputbox 'Digite a senha que deseja utilizar:'		\
	0 0)
VERIFY $CONF_SENHA

if [ $SENHA == $CONF_SENHA ]; then 
useradd -m -r /home/$NOME  -r -s /bin/bash $NOME
( echo $SENHA ; echo  $SENHA ) | passwd $NOME

bash MENUZAUM.sh

else
	dialog --stdout  --infobox "Senha incompatível" 0 0
 sleep 1
DIG
fi
}
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
	2 'Criar um usuário e senha'					\
	3 'Sair')
case $MENU in
	1) FL ;;
	2) CRUS ;;
	3) SAIR ;;
esac
}
DIG
