local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("mike.lsp.handlers").on_attach,
		capabilities = require("mike.lsp.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("mike.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "pyright" then
		local pyright_opts = require("mike.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end
    
    if server.name == "gopls" then
        local gopls_opt = require("mike.lsp.settings.gopls")
        opts = vim.tbl_deep_extend("force", gopls_opt, opts)
    end

    if server.name == "html" then
        local html_opt = require("mike.lsp.settings.html")
        opts = vim.tbl_deep_extend("force", html_opt, opts)
    end

    if server.name == "tsserver" then
        local tsserver_opt = require("mike.lsp.settings.tsserver")
        opts = vim.tbl_deep_extend("force", tsserver_opt, opts)
    end

    if server.name == "cssls" then
        local cssls_opt = require("mike.lsp.settings.cssls")
        opts = vim.tbl_deep_extend("force", cssls_opt, opts)
    end

    if server.name == "rls" then
        local rls_opt = require("mike.lsp.settings.rls")
        opts = vim.tbl_deep_extend("force", rls_opt, opts)
    end
	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
