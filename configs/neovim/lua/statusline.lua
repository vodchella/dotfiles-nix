local ok, lualine = pcall(require, 'lualine')
if not ok then
    return
end
local ok, custom_gruvbox = pcall(require, 'lualine.themes.gruvbox-material')
if not ok then
    return
end

custom_gruvbox.normal.a.bg = '#fcb100'
custom_gruvbox.insert.a.bg = '#b4b800'
custom_gruvbox.visual.a.bg = '#a36f7d'

lualine.setup {
    options = {
        theme = custom_gruvbox,
    }
}
