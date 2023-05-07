local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "TS: Find Files" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "TS: Git Files" })
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "TS: Project Search" })
