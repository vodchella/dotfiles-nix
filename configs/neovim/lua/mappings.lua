local map = vim.keymap.set
local opts = { silent = true }
local fns = require('functions')

vim.g.mapleader = ' '

-- Insert mode
map('i', 'jj',    '<Esc>',     opts)
map('i', '<C-h>', '<Left>',    opts)
map('i', '<C-j>', '<Down>',    opts)
map('i', '<C-k>', '<Up>',      opts)
map('i', '<C-l>', '<Right>',   opts)
map('i', '<C-b>', '<C-Left>',  opts)
map('i', '<C-f>', '<C-Right>', opts)
map("i", "<C-d>", "<Del>",     opts)

map("n", "<Esc>", ":noh<CR>",  opts)

-- Terminal
-- map('n', '<C-t>', ':tabnew | terminal<CR>', opts)
map('n', '<C-t>', ':terminal<CR>', opts)
map('t', '<C-i>', [[<C-\><C-n>]], opts)

-- FZF
map('n', '<C-l>', ':Rg<CR>',      opts)
map('n', '<C-m>', ':Marks<CR>',   opts)
map('n', '<C-f>', ':Files<CR>',   opts)
map('n', '<C-b>', ':Buffers<CR>', opts)

-- Easy align
map('x', 'ga', '<Plug>(EasyAlign)')
map('n', 'ga', '<Plug>(EasyAlign)')
map('v', 'gA', ':EasyAlign //<Left>')

-- Database
map('n', '<leader>qq', ':DBUIToggle<CR>', opts)

-- File browser
map("n", "-", fns.oil_open_float, { desc = 'Open directory' })

-- Comments
-- <C-/> обозначается в Lua как <C-_>.
map('n', '<C-_>', fns.comment_lines_n, opts)
map('v', '<C-_>', fns.comment_lines_v, opts)

-- Tab line
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>",   opts)
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)

-- Hop (quick jumps)
map("n", "<C-s>", "<cmd>HopPattern<CR>", opts)

-- Hodur
map('n', '<C-g>', fns.hodur_open_under_cursor, opts)

-- Selected text moving
map('v', '>', '>gv', opts)
map('v', '<', '<gv', opts)
map('v', '<S-Up>', ':m \'<-2<CR>gv=gv', opts)
map('v', '<S-Down>', ':m \'>+1<CR>gv=gv', opts)
map('v', '<S-K>', ':m \'<-2<CR>gv=gv', opts)
map('v', '<S-J>', ':m \'>+1<CR>gv=gv', opts)

-- Add cursor (visual multi)
map('n', '<C-c>', function()
  vim.cmd('call vm#commands#add_cursor_at_pos(0)')
end, opts)

-- LSP and coding related
map('n', '<leader>e',  vim.diagnostic.open_float,  opts)
map('n', '<leader>E',  vim.diagnostic.setloclist,  opts)
map('n', '<leader>gd', vim.lsp.buf.definition,     opts)
map('n', '<leader>gD', vim.lsp.buf.declaration,    opts)
map('n', '<leader>gi', vim.lsp.buf.implementation, opts)
map('n', '<leader>gr', vim.lsp.buf.references,     opts)
map('n', '<leader>ca', vim.lsp.buf.code_action,    opts)
map('n', '<leader>gs', '<cmd>DocumentSymbols<cr>', opts)
map('n', '<leader>ci', fns.lsp_buf_hover,          opts)
map('n', '<leader>cr', vim.lsp.buf.rename,         opts)
map('n', '<leader>cJ', fns.jdtls_update_project_config, { desc = 'Update JDTLS project configuration' })
map('x', '<leader>ch', fns.git_history_for_selection,   { desc = 'Git history for selection' })
map('n', '<leader>lg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })
map('n', '<leader>cj', '<cmd>TSJToggle<CR>',    opts)
map('n', '<leader>gt', '<cmd>TodoQuickFix<CR>', opts)



-- DAP (отладчик)
local dap_ok, dap   = pcall(require, 'dap')
if dap_ok then
  map('n', '<F9>',       dap.continue,            { desc = 'DAP Continue' })
  map('n', '<F8>',       dap.step_over,           { desc = 'DAP Step Over' })
  map('n', '<F7>',       dap.step_into,           { desc = 'DAP Step Into' })
  map('n', '<S-F8>',     dap.step_out,            { desc = 'DAP Step Out' })
  map('n', '<leader>db', dap.toggle_breakpoint,   { desc = 'DAP Toggle BP' })
  map('n', '<leader>df', fns.dapui_float_element, { desc = 'DAPUI open float window' })
  map('n', '<leader>dB', fns.dap_cond_breakpoint, { desc = 'DAP Conditional BP' })
  map('n', '<leader>dq', fns.dapui_close,         { desc = 'Stop debug and close UI' })
end

map("n", '<leader>cl', '<cmd>Linter<cr>', { desc = 'Run linter' })

