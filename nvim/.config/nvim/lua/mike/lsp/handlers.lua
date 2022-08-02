local Remap = require("mike.keymap")
local nnoremap = Remap.nnoremap

local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function lsp_keymaps(bufnr)
  nnoremap("<leader>gD", ":lua vim.lsp.buf.declaration()<CR>")
  nnoremap("<leader>gd", ":lua vim.lsp.buf.definition()<CR>")
  nnoremap("<leader>gi", ":lua vim.lsp.buf.implementation()<CR>")
  nnoremap("<leader>gr", ":lua vim.lsp.buf.references()<CR>")
  nnoremap("<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
  nnoremap("<leader><C-k>", ":lua vim.lsp.buf.signature_help()<CR>")  -- what is this??
  nnoremap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
  nnoremap("<leader>sd", ":lua vim.diagnostic.open_float()<CR>")
  nnoremap("<leader>[d", ":lua vim.diagnostic.goto_prev({ border = \"rounded\" })<CR>")
  nnoremap("<leader>]d", ":lua vim.diagnostic.goto_next({ border = \"rounded\" })<CR>")
  nnoremap("<leader>gl", ":lua vim.diagnostic.show_line_diagnostics(){ border = \"rounded\" })<CR>")
  nnoremap("<leader>q", ":lua vim.diagnostic.setloclist()<CR>")
  nnoremap("<leader>K", ":lua vim.lsp.buf.hover()<CR>")
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
  end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
