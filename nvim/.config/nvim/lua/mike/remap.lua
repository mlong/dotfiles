vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "RM: Open Netrw" })

vim.keymap.set("i", "jk", "<Esc>", { desc = "RM: Esc" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "RM: Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "RM: Move selection up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "RM: Same as J but keep the cursor where it is" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "RM: Move down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "RM: Move up" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "RM: " })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "RM: Copy to systems clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "RM: Copy line to systems clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "RM: " })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "RM: Format buffer" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "RM: " })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "RM: " })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "RM: " })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "RM: " })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "RM: " })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "RM: Make file executable" })
