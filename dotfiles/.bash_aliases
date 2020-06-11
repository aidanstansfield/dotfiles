alias up='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
alias startvpn='sudo openvpn --askpass --daemon --config '
alias stopvpn='sudo pkill -f '
if type nvim > /dev/null 2>&1; then
    alias vim='nvim'
fi
alias ivm='vim'
alias ll='ls -lA'
