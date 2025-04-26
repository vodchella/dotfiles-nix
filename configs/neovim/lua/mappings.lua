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

-- Open file from grep-string
map('n', '<C-g>', function()
  local line = vim.fn.getline('.')
  local filepath, lineno, colno = string.match(line, "([^:]+):(%d+):(%d+)")

  if not filepath then
    filepath, lineno = string.match(line, "([^:]+):(%d+)")
    colno = 1
  end

  if filepath and lineno then
    -- Проверяем, существует ли файл
    if vim.fn.filereadable(filepath) == 1 then
      vim.cmd('edit ' .. filepath)
      vim.api.nvim_win_set_cursor(0, { tonumber(lineno), tonumber(colno) - 1 })
    else
      print('Файл не найден: ' .. filepath)
    end
  else
    print("Не удалось распарсить строку")
  end
end, opts)
