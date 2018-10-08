# Path
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
export POWERLINE_COMMAND=powerline

# Oh-My-Zsh
POWERLEVEL9K_MODE="nerdfont-fontconfig"
export ZSH=~/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
export EDITOR="vim"
ZSH_TMUX_AUTOSTART='true'
COMPLETION_WAITING_DOTS="true"
plugins=(git tmux python3 ruby sudo zsh-syntax-highlightin)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(docker_machine status history)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='╰\uF460\uF460\uF460 '
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='white'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='black'
POWERLEVEL9K_STATUS_CROSS="true"
DISALBE_AUTO_TITLE="true"


# Extract
function extract() { 
  if [ -f $1 ] ; then 
    case $1 in 
      *.tar.bz2)   tar xjf $1     ;; 
      *.tar.gz)    tar xzf $1     ;; 
      *.bz2)       bunzip2 $1     ;; 
      *.rar)       unrar e $1     ;; 
      *.gz)        gunzip $1      ;; 
      *.tar)       tar xf $1      ;; 
      *.tbz2)      tar xjf $1     ;; 
      *.tgz)       tar xzf $1     ;; 
      *.zip)       unzip $1       ;; 
      *.Z)         uncompress $1  ;; 
      *.7z)        7z x $1        ;; 
      *)     echo "'$1' cannot be extracted via extract()" ;; 
        esac 
      else 
        echo "'$1' is not a valid file" 
      fi 
}
alias x='extract'

# MD5 Checker
function md5check() { 
  md5sum "$1" | grep "$2";
}

# ls
eval `dircolors ~/.dircolors`
alias ls='ls --color -l'

# copy to system
alias cs='xclip -selection clipboard'

# Tmux Start
#[[ $- != *i* ]] && return
#if [[ -z "$TMUX" ]] ;then
#   ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
#    if [[ -z "$ID" ]] ;then # if not available create a new one
#        exec tmux new-session
 #   else
#        exec tmux attach-session -t "$ID" # if available attach to it
#   fi
#fi 
