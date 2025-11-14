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


vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.cmd("startinsert")
        vim.opt_local.relativenumber = true
    end,
})


vim.cmd [[
  highlight ExtraWhitespace ctermbg=red guibg=red

  function! s:ApplyWhitespaceMatch()
    if &buftype ==# 'terminal'
      " для терминального буфера подсветку выключаем
      match none
    else
      " для обычных – включаем
      match ExtraWhitespace /\s\+$/
    endif
  endfunction

  augroup ExtraWhitespace
    autocmd!
    " при входе в окно
    autocmd BufWinEnter * call s:ApplyWhitespaceMatch()
    " после выхода из Insert – снова включаем (если не терминал)
    autocmd InsertLeave * call s:ApplyWhitespaceMatch()
    " при входе в Insert – временно выключаем
    autocmd InsertEnter * match none
    " при уходе из окна – чистим матчи
    autocmd BufWinLeave * call clearmatches()
    " КЛЮЧЕВОЕ: при открытии терминала в текущем окне – сразу выключить
    autocmd TermOpen * match none
  augroup END
]]
