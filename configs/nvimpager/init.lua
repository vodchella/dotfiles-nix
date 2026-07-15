vim.opt.runtimepath:prepend(vim.fn.expand('~/.config/nvim'))
require('settings')

vim.opt.termguicolors = true
vim.opt.packpath:append(vim.fn.expand('~/.local/share/nvim/site'))
vim.cmd.packloadall()
vim.cmd.colorscheme('gruvbox')
