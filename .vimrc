" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plungins
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-scripts/taglist.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ryanoasis/vim-devicons'
Plugin 'airblade/vim-gitgutter'
Plugin 'xolox/vim-misc'
" Plugin 'Valloric/YouCompleteMe'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Settings
set background=dark
set number
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set ruler
set wildmenu
set wildmode=longest:list,full
set showtabline=2
set laststatus=2
set tabstop=8 
set noexpandtab 
set softtabstop=8
set shiftwidth=8
set hidden
set nocompatible
set autochdir
set laststatus=2
set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h11 
set guioptions-=T
set noshowmode
set mouse=a
set lines=65 columns=135
filetype plugin on
set tags=./tags;,tags;$HOME
"let Tlist_Use_Horiz_Window = 1
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Open = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Compact_Format = 0

" Binds
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:ctrlp_map = '<D-o>'
nnoremap <silent> <D-t> :TlistToggle<CR>
nnoremap <silent> <D-r> :TlistAddFilesRecursive ./ *<CR>


" nerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"autocmd vimenter * silent! lcd %:p:h
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:DevIconsEnableFoldersOpenClose = 1
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
			\ exe "normal g'\"" | endif  
autocmd VimEnter * wincmd p

" Color Scheme
let g:solarized_termcolors=16
let g:solarized_contrast="high"
let g:solarized_termtrans=1
colorscheme solarized
filetype plugin indent on

" Powerline
let g:minBufExplForceSyntaxEnable = 1
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

