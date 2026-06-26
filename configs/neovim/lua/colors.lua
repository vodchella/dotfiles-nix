vim.opt.termguicolors = true
vim.cmd[[colorscheme gruvbox]]

vim.api.nvim_set_hl(0, 'FloatBorder', {
    fg = '#d79921',
    bg = '#1d2021',
})
vim.api.nvim_set_hl(0, 'FloatTitle', {
    fg = '#282828',
    bg = '#d79921',
    bold = true,
})
