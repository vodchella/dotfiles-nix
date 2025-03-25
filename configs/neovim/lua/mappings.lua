local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- FZF
map('n', '<C-l>', ':Lines<CR>', { noremap = true, silent = true })
map('n', '<C-m>', ':Marks<CR>', { noremap = true, silent = true })
