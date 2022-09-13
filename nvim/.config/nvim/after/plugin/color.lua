-- tokyonight
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.opt.background = "dark"

-- catppuccin
vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha

require("catppuccin").setup ({
  transparent_background = true,
  term_colors = true,
})



vim.cmd("colorscheme catppuccin")
