print("lsp init")
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("mike.lsp.lsp-installer")
require("mike.lsp.handlers").setup()
