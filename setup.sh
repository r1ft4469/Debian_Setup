#!/bin/bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cd ~/
git clone https://github.com/r1ft4469/Debian_Setup
mkdir ~/.tmux
cp Debian_Setup/.tmux.conf ~/
cp Debian_Setup/.vimrc ~/
cp Debian_Setup/.zshrc ~/
cp Debian_Setup/tmux_split_pane.sh ~/.tmux/
chmod +x ~/.tmux/tmux_split_pane.sh
cp -r Debian_Setup/.config ~/
cp -r Debian_Setup/.dircolors ~/
rm -rf Debain_Setup
cd ~
if [ -d ~/.vim/bundle ]; then
	cd ~/.tmux
	git pull
	cd ~/.oh-my-zsh/custom/themes/powerlevel9k
	git pull
	#cd ~/.vim/bundle/supertab
	#git pull
	#cd ~/.vim/bundle/syntastic
	#git pull
	#cd ~/.vim/bundle/ultisnips
	#git pull
        #cd ~/.vim/bundle/vim-colors-solarized
	#git pull
	#cd ~/.vim/bundle/vim-gitgutter
	#git pull
	#cd ~/.vim/bundle/vim-snippets
	#git pull
	cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	git pull
	source .zshrc
else
	pip3 install powerline-status
	sudo pip3 install powerline-status
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
	#mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	#curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	#cd ~/.vim/bundle
	#git clone git://github.com/altercation/vim-colors-solarized.git
	#git clone git://github.com/airblade/vim-gitgutter.git
	#git clone git://github.com/ervandew/supertab
	#git clone git://github.com/SirVer/ultisnips
	#git clone https://github.com/honza/vim-snippets.git
	#git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	git config --global core.pager cat
	cd ~
fi
