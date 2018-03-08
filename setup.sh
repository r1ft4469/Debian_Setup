#!/bin/bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cd /tmp
git clone https://github.com/r1ft4469/Ubuntu_Setup
cp Ubuntu_Setup/.tmux.conf ~/
cp Ubuntu_Setup/.vimrc ~/
cp Ubuntu_Setup/.zshrc ~/
rm -rf Ubuntu_Setup
cd ~
pip3 install powerline-status
sudo pip3 install powerline-status
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
mkdir ~/.tmux
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git
git clone git://github.com/airblade/vim-gitgutter.git
git clone git://github.com/ervandew/supertab
git clone git://github.com/SirVer/ultisnips
git clone https://github.com/honza/vim-snippets.git
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
git config --global core.pager cat
cd ~

