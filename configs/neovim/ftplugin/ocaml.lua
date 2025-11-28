local client_name = 'ocaml-lsp'
local bufnr = vim.api.nvim_get_current_buf()

-- Не запускать повторно, если уже есть такой клиент на буфере
for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
  if client.name == client_name then
    return
  end
end

local root_dir = vim.fs.root(bufnr, { 'dune-project', 'dune-workspace', '.git' }) -- or vim.fn.getcwd()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local capabilities = vim.lsp.protocol.make_client_capabilities()

local on_attach = function(client, b)
  vim.notify('LSP attached: ' .. client.name, vim.log.levels.INFO)
end

vim.lsp.start({
  name = client_name,
  -- { vim.fn.stdpath("data") .. "/mason/bin/ocamllsp" }
  cmd = { 'ocamllsp' },
  root_dir = root_dir,
  capabilities = capabilities,
  on_attach = on_attach,
})
