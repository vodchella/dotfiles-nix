local map = vim.keymap.set
local opts = { silent = true }

vim.g.mapleader = ' '

-- Terminal
map('n', '<C-t>', ':terminal<CR>', opts)
map('t', '<C-i>', [[<C-\><C-n>]], opts)

-- FZF
map('n', '<C-l>', ':Lines<CR>', opts)
map('n', '<C-m>', ':Marks<CR>', opts)
map('n', '<C-f>', ':Files<CR>', opts)
map('n', '<C-b>', ':Buffers<CR>', opts)

-- File browser
map("n", "-", require("oil").open_float, { desc = "Open parent directory" })

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

-- LSP
map('n', '<leader>gd', vim.lsp.buf.definition, opts)
map('n', '<leader>gD', vim.lsp.buf.declaration, opts)
map('n', '<leader>gi', vim.lsp.buf.implementation, opts)
map('n', '<leader>gr', vim.lsp.buf.references, opts)
map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
map('n', '<leader>cr', vim.lsp.buf.rename, opts)
map('n', '<leader>e',  vim.diagnostic.open_float, opts)

-- убираем любые <CR> маппинги в qf-буфере, иначе невозможно ничего выбрать в списке по '<leader>gr'
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function(ev)
    pcall(vim.keymap.del, "n", "<CR>", { buffer = ev.buf })
    pcall(vim.keymap.del, "i", "<CR>", { buffer = ev.buf })
    pcall(vim.keymap.del, "v", "<CR>", { buffer = ev.buf })
    -- на всякий случай явно зададим дефолт:
    vim.keymap.set("n", "<CR>", "<CR>", { buffer = ev.buf, noremap = true, silent = true })
  end,
})
