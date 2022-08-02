local Remap = require("mike.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<leader>e", ":Ex<CR>")
nnoremap("<leader>u", ":UndotreeShow<CR>")


inoremap("jk", "<ESC>")

