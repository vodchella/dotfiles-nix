local set = vim.opt

set.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'
set.keymap = 'russian-jcukenwin'
set.iminsert = 0
set.imsearch = 0

set.swapfile = false

set.number = true
set.relativenumber = true
set.nu = true
set.rnu = true
set.listchars = 'tab:··'
set.list = true
set.tabstop = 4
set.shiftwidth = 4
set.smarttab = true
set.expandtab = true

set.hlsearch = true
set.incsearch = true

set.wrap = true
set.mouse = 'a'
set.clipboard = 'unnamedplus'

set.cursorline = true
set.scrolloff = 5


vim.opt.termguicolors = true
vim.cmd[[colorscheme gruvbox]]

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.cmd("startinsert")
        vim.opt_local.relativenumber = true
    end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 and vim.fn.line2byte('$') == -1 then
      vim.cmd("intro")
    end
  end,
})
