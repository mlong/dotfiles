local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = "HARPOON: Jump to 1" })
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end, { desc = "HARPOON: Jump to 2" })
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end, { desc = "HARPOON: Jump to 3" })
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end, { desc = "HARPOON: Jump to 4" })
