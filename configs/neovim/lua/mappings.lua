local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- FZF
map('n', '<C-l>', ':Lines<CR>', opts)
map('n', '<C-m>', ':Marks<CR>', opts)
map('n', '<C-f>', ':Files<CR>', opts)
