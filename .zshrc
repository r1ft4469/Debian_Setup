# Oh-My-Zsh
POWERLEVEL9k_MODE='awsome-fontconfig'
export ZSH=/home/r1ft/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
export EDITOR="vim"
export TERM="xterm-256color"
COMPLETION_WAITING_DOTS="true"
plugins=(git tmux python3 ruby sudo zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs battery time)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs)
POWERLEVEL9K_IP_BACKGROUND='green'
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
alias ls='ls --color -la'

# update
function r1ft_update() {
	sudo apt update
	sudo apt upgrade
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/r1ft4469/Ubuntu_Setup/master/setup.sh)"
}
