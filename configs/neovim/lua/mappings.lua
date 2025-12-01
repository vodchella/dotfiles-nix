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

-- Terminal
map('n', '<C-t>', ':terminal<CR>', opts)
map('t', '<C-i>', [[<C-\><C-n>]], opts)

-- FZF
map('n', '<C-l>', ':Lines<CR>', opts)
map('n', '<C-m>', ':Marks<CR>', opts)
map('n', '<C-f>', ':Files<CR>', opts)
map('n', '<C-b>', ':Buffers<CR>', opts)

-- Database
map('n', '<leader>qq', ':DBUIToggle<CR>', opts)

-- File browser
map("n", "-", require('oil').open_float, { desc = 'Open parent directory' })

-- Comments
-- <C-/> обозначается в Lua как <C-_>.
local comment_not_loaded = "Comment.nvim doesn't loadad, PackerSync will save you :)"
map('n', '<C-_>', function()
  local ok, api = pcall(require, 'Comment.api')
  if not ok then
    vim.notify(comment_not_loaded, vim.log.levels.WARN)
    return
  end
  api.toggle.linewise.current()
end, opts)
map('v', '<C-_>', function()
  local ok, api = pcall(require, 'Comment.api')
  if not ok then
    vim.notify(comment_not_loaded, vim.log.levels.WARN)
    return
  end
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
  api.toggle.linewise(vim.fn.visualmode())
end, opts)

-- Tab line
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", opts)
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)

-- Hop (quick jumps)
map("n", "<C-s>", "<cmd>HopPattern<CR>", opts)

-- Hodur
map('n', '<C-g>', function()
  local ok, api = pcall(require, 'hodur')
  if not ok then
    vim.notify("Hodur.nvim doesn't loadad, PackerSync will save you :)", vim.log.levels.WARN)
    return
  end
  api.open_under_cursor()
end, opts)

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
map('n', '<leader>e',  vim.diagnostic.open_float, opts)
map('n', '<leader>E',  vim.diagnostic.setloclist, opts)
map('n', '<leader>gd', vim.lsp.buf.definition, opts)
map('n', '<leader>gD', vim.lsp.buf.declaration, opts)
map('n', '<leader>gi', vim.lsp.buf.implementation, opts)
map('n', '<leader>gr', vim.lsp.buf.references, opts)
map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
map('n', '<leader>gs', '<cmd>DocumentSymbols<cr>', opts)
map('n', '<leader>cr', vim.lsp.buf.rename, opts)
map('n', '<leader>cJ', fns.jdtls_update_project_config, { desc = 'Update JDTLS project configuration' })
map('x', '<leader>ch', fns.git_history_for_selection, { desc = 'Git history for selection' })
map('n', '<leader>lg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })
map('n', '<leader>cj', '<cmd>TSJToggle<CR>', opts)
map('n', '<leader>ct', '<cmd>TodoQuickFix<CR>', opts)



-- DAP (отладчик)
local dap, dapui = require('dap'), require('dapui')
dapui.setup()

-- Авто-открытие/закрытие UI
dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open()  end
dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
dap.listeners.before.event_exited['dapui_config']     = function() dapui.close() end

map('n', '<F9>',        dap.continue,          { desc='DAP Continue' })
map('n', '<F8>',        dap.step_over,         { desc='DAP Step Over' })
map('n', '<F7>',        dap.step_into,         { desc='DAP Step Into' })
map('n', '<S-F8>',      dap.step_out,          { desc='DAP Step Out' })
map('n', '<leader>db',  dap.toggle_breakpoint, { desc='DAP Toggle BP' })
map('n', '<leader>dB',  function()
  vim.ui.input({ prompt = 'Condition: ' }, function(cond)
    if cond then dap.set_breakpoint(cond) end
  end)
end, { desc='DAP Conditional BP' })
map('n', '<leader>dq',  function()
  local dap = require('dap')
  local dapui = require('dapui')

  -- Сначала остановить/отсоединиться от отладочной JVM
  dap.terminate()
  dap.disconnect({ terminateDebuggee = true })

  -- Затем закрыть интерфейс (панели, консоль, т.д.)
  dapui.close()
end, { desc = 'Stop debug and close UI' })


-- Checkstyle
vim.api.nvim_create_user_command("Checkstyle", function()
  if vim.bo.filetype == "java" then
    require("checkstyle").run_current_file()
  else
    vim.notify("Checkstyle только для Java-файлов!", vim.log.levels.WARN)
  end
end, {})
map("n", '<leader>cl', '<cmd>Checkstyle<cr>', { desc = 'Run linter' })

