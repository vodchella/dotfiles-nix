local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
    return
end

-- local snip_status_ok, luasnip = pcall(require, "luasnip")
-- if not snip_status_ok then
--     return
-- end

-- require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup {
    -- snippet = {
    --     expand = function(args)
    --         luasnip.lsp_expand(args.body)
    --     end,
    -- },
    sources = {
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp' },
        -- { name = 'nvim_lua' },
        -- { name = 'luasnip' },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
}
