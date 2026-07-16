require('vim._core.ui2').enable()

vim.g.tpipeline_autoembed = 0

local set = vim.opt

set.langmap        = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'
set.keymap         = 'russian-jcukenwin'
set.iminsert       = 0
set.imsearch       = 0

set.swapfile       = false
set.autoread       = true

set.number         = true
set.relativenumber = true
set.nu             = true
set.rnu            = true
set.listchars      = 'tab:» '
set.list           = true
set.tabstop        = 4
set.shiftwidth     = 4
set.smarttab       = true
set.expandtab      = true
set.signcolumn     = 'number'
set.linebreak      = true

set.hlsearch       = true
set.incsearch      = true
set.ignorecase     = true
set.smartcase      = true
set.inccommand     = 'split'

set.wrap           = true
set.mouse          = 'a'
set.clipboard      = 'unnamedplus'

set.cursorline     = true
set.scrolloff      = 5

-- Enable project-local config
set.exrc           = true
set.secure         = true

vim.env.FZF_DEFAULT_COMMAND = "fd --type file"
vim.g.fzf_preview_window    = {}
