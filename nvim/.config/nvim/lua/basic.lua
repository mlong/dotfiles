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
vim.g.guicursor=""

vim.wo.number = true
vim.wo.wrap = false
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.scrolloff = 8

vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.swapfile = false
vim.bo.syntax='ON'

vim.opt.laststatus = 3
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.guicursor=''
vim.opt.splitbelow=true
vim.opt.splitright=true
vim.opt.wildignore = {'*/.git/*'}

vim.o.completeopt = "menu,noselect"

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.vim/plugged')

Plug 'https://github.com/tjdevries/gruvbuddy.nvim'
Plug 'https://github.com/gruvbox-community/gruvbox'
Plug 'luisiacc/gruvbox-baby'
Plug 'neovim/nvim-lspconfig'
Plug 'ThePrimeagen/vim-be-good'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mhinz/vim-rfc'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'})
Plug 'ziglang/zig.vim'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

vim.call('plug#end')

vim.cmd [[
    colorscheme gruvbuddy
]]

vim.cmd [[ highlight WinSeparator guibg=None ]]

local map = vim.api.nvim_set_keymap
map('i', 'jk', '<ESC>', {noremap = true})
map('n', '<Leader>ff', ':Telescope find_files<CR>', {noremap = true})
map('n', '<Leader>fb', ':Telescope buffers<CR>', {noremap = true})
map('n', '<Leader>fg', ':Telescope live_grep<CR>', {noremap = true})
map('n', '<Leader>fh', ':Telescope help_tags<CR>', {noremap = true})
map('n', '<Leader>vrc', "<cmd>lua require('tscope').search_dotfiles()<CR>", {noremap = true})
