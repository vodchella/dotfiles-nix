local map = vim.keymap.set
local opts = { silent = true }

-- Terminal
map('n', '<C-t>', ':terminal<CR>', opts)
map('t', '<C-i>', [[<C-\><C-n>]], opts)

-- FZF
map('n', '<C-l>', ':Lines<CR>', opts)
map('n', '<C-m>', ':Marks<CR>', opts)
map('n', '<C-f>', ':Files<CR>', opts)
map('n', '<C-b>', ':Buffers<CR>', opts)

local open_file = require('open_file')
map('n', '<C-g>', open_file.open_file_under_cursor, opts)
