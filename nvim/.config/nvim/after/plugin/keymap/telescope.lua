local Remap = require("mike.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<C-p>", ":Telescope")

nnoremap("<Leader>ff", function()
	require("telescope.builtin").find_files()
end)

nnoremap("<Leader>fb", function()
	require("telescope.builtin").buffers()
end)

nnoremap("<Leader>fh", function()
	require("telescope.builtin").help_tags()
end)
