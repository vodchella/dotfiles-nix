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
