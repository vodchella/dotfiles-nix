local client_name = 'ocaml-lsp'
local bufnr = vim.api.nvim_get_current_buf()

local root_dir = vim.fs.root(bufnr, { 'dune-project', 'dune-workspace', '.git' })
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- local on_attach = function(client, b)
--   vim.notify('LSP attached: ' .. client.name .. ' (buf ' .. b .. ')')
-- end
local on_init = function(client)
  vim.notify("LSP started: " .. client.name)
end

vim.lsp.start({
  name = client_name,
  cmd = { 'ocamllsp' },
  root_dir = root_dir,
  capabilities = capabilities,
  on_init = on_init,
  -- on_attach = on_attach,
})
