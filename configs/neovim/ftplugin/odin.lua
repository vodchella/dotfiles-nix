local client_name = 'ols'
local bufnr = vim.api.nvim_get_current_buf()

local root_dir = vim.fs.root(bufnr, {
    'ols.json',
    'flake.nix',
    '.git',
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_init = function(client)
    vim.notify('LSP started: ' .. client.name)
end

vim.lsp.start({
    name = client_name,
    cmd = { 'ols' },
    root_dir = root_dir,
    capabilities = capabilities,
    on_init = on_init,
})
