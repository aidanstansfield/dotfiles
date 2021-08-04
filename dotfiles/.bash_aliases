unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac

if [[ $MACHINE == "Mac" ]]; then
    alias up='brew update && brew upgrade'
    alias sqlmap='/opt/sqlmap-dev/sqlmap.py'
elif [[ $MACHINE == "Linux" ]]; then
    alias up='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
fi

alias startvpn='sudo openvpn --askpass --daemon --config '
alias stopvpn='sudo pkill -f '
if type nvim > /dev/null 2>&1; then
    alias vim='nvim'
fi
alias ivm='vim'
alias ll='ls -lA'
if [ -x /usr/bin/batcat ]; then
    alias bat='batcat'
fi
alias dc='docker-compose'
