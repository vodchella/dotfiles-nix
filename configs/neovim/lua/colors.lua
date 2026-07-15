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

local function setup_neogit_highlights()
    local highlights = {
        NeogitDiffAdd = {
            fg = '#b8bb26',
            bg = '#32361a',
        },
        NeogitDiffAddHighlight = {
            fg = '#d8e06c',
            bg = '#454b1f',
        },
        NeogitDiffAddCursor = {
            fg = '#fbf1c7',
            bg = '#5a6129',
            bold = true,
        },
        NeogitDiffAddInline = {
            fg = '#fbf1c7',
            bg = '#5a6129',
            bold = true,
        },

        NeogitDiffDelete = {
            fg = '#fb4934',
            bg = '#3c1f1e',
        },
        NeogitDiffDeleteHighlight = {
            fg = '#ff7b68',
            bg = '#542523',
        },
        NeogitDiffDeleteCursor = {
            fg = '#fbf1c7',
            bg = '#6b2b27',
            bold = true,
        },
        NeogitDiffDeleteInline = {
            fg = '#fbf1c7',
            bg = '#6b2b27',
            bold = true,
        },

        NeogitDiffContext = {
            bg = '#282828',
        },
        NeogitDiffContextHighlight = {
            bg = '#32302f',
        },
        NeogitDiffContextCursor = {
            bg = '#3c3836',
        },

        NeogitHunkHeader = {
            fg = '#a89984',
            bg = '#3c3836',
        },
        NeogitHunkHeaderHighlight = {
            fg = '#ebdbb2',
            bg = '#504945',
            bold = true,
        },
        NeogitHunkHeaderCursor = {
            fg = '#fbf1c7',
            bg = '#665c54',
            bold = true,
        },
    }

    for name, value in pairs(highlights) do
        vim.api.nvim_set_hl(0, name, value)
    end
end

setup_neogit_highlights()

vim.api.nvim_create_autocmd('ColorScheme', {
    callback = setup_neogit_highlights,
})
