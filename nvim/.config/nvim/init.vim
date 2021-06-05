filetype plugin indent on

syntax enable
set encoding=utf-8
set showcmd
set number
set ruler
set nowrap
set tabstop=2 shiftwidth=2
set backspace=indent,eol,start
set hlsearch
set incsearch
set smartcase
set shm+=I
set splitbelow splitright
set path+=**
set wildmenu
set guicursor=
set signcolumn=yes
set noerrorbells
set nu
set hidden
set scrolloff=8

inoremap jk <ESC>

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/gruvbox-community/gruvbox'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" Set color scheme
colorscheme gruvbox
