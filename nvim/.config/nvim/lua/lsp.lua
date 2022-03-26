local nvim_lsp = require('lspconfig')

--nvim_lsp.gopls.setup{}
local function lsp_map(mode, left_side, right_side)
    vim.api.nvim_buf_set_keymap(0, mode, left_side, right_side, {noremap=true})
end

local function default_on_attach(client)
    print('Attaching to ' .. client.name)

    lsp_map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')    
    lsp_map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')    
    lsp_map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')    
    lsp_map('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')    
    lsp_map('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')    
    lsp_map('n', 'gr', ':lua vim.lsp.buf.references()<CR>')    
    lsp_map('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')    
    lsp_map('n', 'K', ':lua vim.lsp.buf.hover()<CR>')    
    lsp_map('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')    
    lsp_map('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>')    
    lsp_map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')    
end

local default_config = {
    on_attach = default_on_attach,
}

local pid = vim.fn.getpid()
local cache_path = vim.fn.stdpath('cache')


-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "bashls", "gopls"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
