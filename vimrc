"======== Set up Vundle ==============
set nocompatible			  " be iMproved, required
filetype off				  " required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

	"" The following are examples of different formats supported.
	"" Keep Plugin commands between vundle#begin/end.
	"" plugin on GitHub repo
	"Plugin 'tpope/vim-fugitive'
	"" plugin from http://vim-scripts.org/vim/scripts.html
	"Plugin 'L9'
	"" Git plugin not hosted on GitHub
	"Plugin 'git://git.wincent.com/command-t.git'
	"" git repos on your local machine (i.e. when working on your own plugin)
	"Plugin 'file:///home/gmarik/path/to/plugin'
	"" The sparkup vim script is in a subdirectory of this repo called vim.
	"" Pass the path to set the runtimepath properly.
	"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
	"" Avoid a name conflict with L9
	"Plugin 'user/L9', {'name': 'newL9'}
	"" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'			"Plugin Manager
Plugin 'scrooloose/nerdtree'			"filetree
"Plugin 'bling/vim-airline'			"statusline
Plugin 'itchyny/lightline.vim'			"Statusline
"Plugin 'powerline/powerline'			"another statusline
Plugin 'tpope/vim-surround'
Plugin 'xolox/vim-notes'			"easy note taking
Plugin 'xolox/vim-misc'				"dependency for vim-notes
"Plugin 'scrooloose/syntastic'
"Plugin easymotion
"Plugin 'kien/ctrlp.vim'
"Plugin snipmate
Plugin 'tpope/vim-fugitive'			"git wrapper
Plugin 'nathanaelkane/vim-indent-guides'	"intend guides

"colorschemes
Plugin 'nanotech/jellybeans.vim'
Plugin 'fugalh/desert.vim'
Plugin 'vim-scripts/BusyBee'
Plugin 'mhartington/oceanic-next'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'

call vundle#end()

"====== Colors and Fonts ============

" Colorscheme
if has("gui_running")
	colorscheme OceanicNext
	set background=dark
else
	set t_Co=256
	"let g:solarized_termcolors=256
	colorscheme OceanicNext
	set background=dark
endif

" enable syntax highlighning
if has("syntax")
	syntax on
endif

" set UTF-8 as standart encoding
set encoding=utf8

" use unix as default file type
set ffs=unix,dos,mac

"====== General Settings ====================

" leaderkey to ,
let mapleader = ","

" enable filetype plugins
filetype plugin indent on	 " required by Vundle

" set autoread when file is changed from the outside
set autoread

if has("autocmd")
	"following to have Vim jump to the last position when  reopening a file
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

	"costumisations bases on file-type
	autocmd FileType markdown setlocal ts=4 sts=4 sw=4 expandtab
endif


"====== Vim settings ==========
" Show (partial) command in status line.
set showcmd

" show current position
set ruler

" show line numers
set number

" Show matching brackets.
set showmatch

" do not show mode
set noshowmode

" better comand line completion
set wildmenu

"" highlight search results
"set hlsearch

" Do smart case matching
set smartcase

" Incremental search
set incsearch

" auto einrücken
set autoindent

" Hide buffers when they are abandoned
set hidden

" Do case insensitive matching
"set ignorecase

" Automatically save before commands like :next and :make
"set autowrite

" always show statusline
set laststatus=2

" show invisible characters
set list

"set absolute numbers when in insert mode but relative numbers when in normal mode
"autocmd InsertEnter * :set number
"autocmd InsertLeave * :set relativenumber

"appearance of non visible characters
set listchars=tab:▸\ ,eol:¬

"configure tab
set ts=4 sts=4 sw=4
set noexpandtab

"======= gui settings ===============
if has ("gui_running")
	set go-=m	"remove menu bar
	set go-=T	"remove toolbar
	set guitablabel=%M\ %t
endif
"========= OTHER ===========================
" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

"===== Plugin Settings =================
"Airline [powerline patched fonts needed]
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\	 'left': [ [ 'mode', 'paste' ],
			\			   [ 'fugitive','readonly', 'filename', 'modified' ] ]
			\ },
			\ 'component': {
			\   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
			\   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
			\   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
			\ },
			\ 'component_visible_condition': {
			\   'readonly': '(&filetype!="help"&& &readonly)',
			\   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
			\   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
			\ }
			\ }
"\ 'separator': {'left': '', 'right': ''},
"\ 'subseparator': { 'left': '⮁', 'right': '⮃' }


"NERDTree
"autoshow when open empty
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"===== Funktions =======================

"toggle relativenumber
function! NumberToggle()
	if(&relativenumber==1)
		set number
	else
		set relativenumber
	endif
endfunc
"======= KEY REMAPPING ===============


" Disable arrow keys in Normal-Mode
noremap <Down> <Nop>
noremap <Up> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" Disable arrow keys in Insert-Mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"copy to clipboard
noremap <leader>c "+y
" paste from clipboard
noremap <leader>v "*p

" fast saving
nmap <leader>w :w!<cr>
" quit
nmap <leader>q :q<cr>

"tolggle relative number
nnoremap <leader>n :call NumberToggle()<CR>

"toggle set list to show invisible characters
nmap <leader>l :set list!<CR>

"toggle NERDTree
map <F2> :NERDTreeToggle<Cr>

"copy and paste
vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!xclip -selection c<CR>u
map <insert> :set paste<CR>i<CR><CR><Esc>k:.!xclip -o<CR>JxkJx:set nopaste<CR>
