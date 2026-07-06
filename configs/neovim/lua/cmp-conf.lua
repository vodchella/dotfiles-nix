local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
    vim.notify('nvim-cmp config is not ok', vim.log.levels.WARN)
    return
end

cmp.setup {
    sources = {
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp' },
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

cmp.setup.filetype({ 'sql', 'mysql', 'plsql' }, {
  sources = cmp.config.sources({
    { name = 'vim-dadbod-completion' },
    { name = 'buffer' },
  }),
})
