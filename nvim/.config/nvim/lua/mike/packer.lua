return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("sbdchd/neoformat")

	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")

	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("williamboman/nvim-lsp-installer")

	use("mbbill/undotree")

	use("nvim-treesitter/nvim-treesitter", {
		run = ":TSUpdate"
	})

	-- Colour Schemes
	use("folke/tokyonight.nvim")

    use("kyazdani42/nvim-web-devicons")
    use { "catppuccin/nvim", as = "catppuccin" }
end)
