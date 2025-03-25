local custom_gruvbox = require'lualine.themes.gruvbox-material'

custom_gruvbox.normal.a.bg = '#fcb100'
custom_gruvbox.insert.a.bg = '#b4b800'
custom_gruvbox.visual.a.bg = '#a36f7d'

require('lualine').setup {
    options = {
        theme = custom_gruvbox,
    }
}
