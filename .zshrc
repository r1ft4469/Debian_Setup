# Path
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
export POWERLINE_COMMAND=powerline

# Oh-My-Zsh
POWERLEVEL9k_MODE='awsome-fontconfig'
export ZSH=/home/r1ft/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
export EDITOR="vim"
COMPLETION_WAITING_DOTS="true"
plugins=(git tmux python3 ruby sudo zsh-syntax-highlightin zsh-dircolors-solarized)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs_joined time)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
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
alias ls='ls --color -l'

# copy to system
alias cs='xclip -selection clipboard'

# backup
function rsyncbackup() {
    sudo mkdir /mnt/rsync
    sudo cryptsetup open "${$(df -k --output=source / | tail -n1)%?}3" rsync_crypt
    sudo mount /dev/mapper/rsync_crypt /mnt/rsync
    sudo rsync -axH --info=progress2 --delete --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / /mnt/rsync
    sudo dpkg --get-selections > ~/.pkg.list
    sudo apt-key exportall > ~/.repo.keys
	dconf dump /org/gnome/ > ~/.gnome_settings.txt
    sudo umount /mnt/rsync
    sudo cryptsetup close rsync_crypt
    sudo rm -rf /mnt/rsync  
}

# restore
function rsyncrestore() {
    sudo mkdir /mnt/rsync
    sudo cryptsetup open "${$(df -k --output=source / | tail -n1)%?}3" rsync_crypt
    sudo mount /dev/mapper/rsync_crypt /mnt/rsync
    sudo rsync -axHAWXS --info=progress2 --delete --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} /mnt/rsync /
    sudo umount /mnt/rsync
    sudo cryptsetup close rsync_crypt
    sudo rm -rf /mnt/rsync
}

# reinstall
function rsyncinstall() {
    echo mount rsync to /mnt/rsync
    read -n1 -r -p "Press any key to continue..." key
    sudo apt-key add /mnt/rsync/repo.keys
    sudo rsync -axHAWXS --info=progress2 /mnt/rsync/etc /etc
    sudo apt update
    sudo apt install dselect
    sudo dselect update
    sudo dpkg --set-selection < /mnt/rsync/pkg.list
    sudo apt-get dselect-upgrade -y
    pip3 install powerline-status
    sudo pip3 install powerline-status
    git config --global core.pager cat
    dconf reset -f /org/gnome/
    dconf load /org/gnome/ < /mnt/rsync/gnome_settings.txt
    echo rebooting
    read -n1 -r -p "Press any key to continue..." key
}

# Tmux Start
[[ $- != *i* ]] && return
if [[ -z "$TMUX" ]] ;then
    ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        exec tmux new-session
    else
        exec tmux attach-session -t "$ID" # if available attach to it
    fi
fi 
