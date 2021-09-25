vim.g.mapleader = ' '
vim.g.showcmd = true
vim.g.ruler = true
vim.g.backspace = 'indent,eol,start'
vim.g.hlsearch = true
vim.g.incsearch = true
vim.g.ignorecase = true
vim.g.smartcase = true
vim.g.backup = false
vim.g.undodir = '~/.vim/undodir'
vim.g.undofile = true
--vim.g.scrolloff = 8

vim.wo.number = true
vim.wo.wrap = false
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'

vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.swapfile = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.vim/plugged')

Plug 'https://github.com/gruvbox-community/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'ThePrimeagen/vim-be-good'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mhinz/vim-rfc'

vim.call('plug#end')

vim.cmd [[
    filetype plugin indent on
    syntax enable
    colorscheme gruvbox
    set splitbelow
    set splitright
    set guicursor=
    set scrolloff=8
    set wildignore+=**/.git/*
]]

local map = vim.api.nvim_set_keymap
map('i', 'jk', '<ESC>', {noremap = true})
map('n', '<Leader>ff', ':Telescope find_files<CR>', {noremap = true})
map('n', '<Leader>fb', ':Telescope buffers<CR>', {noremap = true})
map('n', '<Leader>fg', ':Telescope live_grep<CR>', {noremap = true})
map('n', '<Leader>fh', ':Telescope help_tags<CR>', {noremap = true})

vim.api.nvim_set_keymap(
  'n',
  '<Leader>vrc',
  "<cmd>lua require('tscope').search_dotfiles()<CR>",
  {noremap = true}
)
