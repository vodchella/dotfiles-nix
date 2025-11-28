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

  function! s:IsSpecialWindow() abort
    " Терминал
    if &buftype ==# 'terminal'
      return 1
    endif

    " Quickfix / location list
    if &buftype ==# 'quickfix'
      return 1
    endif

    " Help
    if &buftype ==# 'help'
      return 1
    endif

    " DAP окна (repl, float и т.п.)
    if &filetype =~# 'dap'
      return 1
    endif

    " Dadbod UI: главное окно и результаты запросов
    if &filetype ==# 'dbui' || &filetype ==# 'dbout'
      return 1
    endif

    " Любое floating окно (hover, preview и т.п.)
    if nvim_win_get_config(0)['relative'] !=# ''
      return 1
    endif

    return 0
  endfunction

  function! s:ApplyWhitespaceMatch() abort
    if s:IsSpecialWindow()
      match none
    else
      match ExtraWhitespace /\s\+$/
    endif
  endfunction

  augroup ExtraWhitespace
    autocmd!
    autocmd BufWinEnter * call s:ApplyWhitespaceMatch()
    autocmd InsertLeave * call s:ApplyWhitespaceMatch()
    autocmd InsertEnter * match none
    autocmd BufWinLeave * call clearmatches()
    autocmd TermOpen    * match none
  augroup END
]]
