[[ ! -e /usr/lib/sshplus ]] && exit 0
tput setaf 7;tput setab 4;tput bold;printf '%30s%s%-15s\n' "Criar Usuário SSH";tput sgr0
echo ""
echo -ne "\033[1;32mNome do usuário:\033[1;37m ";read username
[[ -z $username ]] && {
	echo -e "\n${cor1}Nome de usuário vazio ou invalido!${scor}\n"
	exit 1
}
[[ "$(grep -wc $username /etc/passwd)" != '0' ]] && {
	echo -e "\n${cor1}Este usuário já existe. tente outro nome!${scor}\n"
	exit 1
}
[[ ${username} != ?(+|-)+([a-zA-Z0-9]) ]] && {
	echo -e "\n${cor1}Você digitou um nome de usuário inválido!${scor}"
	echo -e "${cor1}Não use espaços, acentos ou caracteres especiais!${scor}\n"
	exit 1
}
sizemin=$(echo ${#username})
[[ $sizemin -lt 2 ]] && {
	echo -e "\n${cor1}Você digitou um nome de usuário muito curto${scor}"
	echo -e "${cor1}use no mínimo dois caracteres!${scor}\n"
	exit 1
}
sizemax=$(echo ${#username})
[[ $sizemax -gt 25 ]] && {
	echo -e "\n${cor1}Você digitou um nome de usuário muito grande"
	echo -e "${cor1}use no máximo 10 caracteres!${scor}\n"
	exit 1
}
echo -ne "\033[1;32mSenha:\033[1;37m ";read password
[[ -z $password ]] && {
	echo -e "\n${cor1}Senha vazia ou invalida!${scor}\n"
	exit 1
}
sizepass=$(echo ${#password})
[[ $sizepass -lt 4 ]] && {
	echo -e "\n${cor1}Senha curta!, use no mínimo 4 caracteres${scor}\n"
	exit 1
