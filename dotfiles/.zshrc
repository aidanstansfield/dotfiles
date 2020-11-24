# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch notify correct
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/aidan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac

if [[ $MACHINE == "Mac" ]]; then
    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
    PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
    PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
    PATH="/usr/local/opt/openvpn/sbin:$PATH"
    export PATH
fi

PATH="$HOME/.local/bin:$PATH"
export PATH

dircolors="eeleater"
lscolors="molokai"

which -s dircolors 1>/dev/null # -s doesn't work on macOS :shrug:
# enable color support of ls and also add handy aliases
if [[ $? == 0 ]]; then
    test -r ~/.dircolors/$dircolors && eval "$(dircolors -b ~/.dircolors/$dircolors)" || eval "$(dircolors -b)"
    if [[ -f ~/.lscolors/$lscolors ]]; then
        LS_COLORS=$(cat ~/.lscolors/$lscolors); export LS_COLORS
    fi
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# bat colour
export BAT_THEME="Dracula"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# magic to start ssh_agent
if [[ -f ~/.ssh/start_agent ]]; then
	source ~/.ssh/start_agent
fi

[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## zplug stuff
source ~/.zplug/init.zsh

# self manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# load theme file
zplug "dracula/zsh", as:theme

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh

# Load completion library for those sweet [tab] squares
zplug "lib/completion", from:oh-my-zsh

# syntax highlighting
zplug "zsh-users/zsh-syntax-highlighting", defer:3

# auto complete
zplug "zsh-users/zsh-autosuggestions", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
## end of zplug stuff



#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/aidan/.sdkman"
[[ -s "/Users/aidan/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/aidan/.sdkman/bin/sdkman-init.sh"
