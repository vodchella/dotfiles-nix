local ok, treesitter_cfg = pcall(require, 'nvim-treesitter.configs')
if not ok then
    return
end
treesitter_cfg.setup {
    ensure_installed = {
        -- 'ada',
        'bash',
        -- 'dockerfile',
        'fish',
        -- 'gitignore',
        'gleam',
        -- 'html',
        'java',
        -- 'json',
        -- 'lua',
        'make',
        -- 'markdown',
        'nix',
        'ocaml',
        'ocaml_interface',
        'odin',
        -- 'pascal',
        'python',
        -- 'regex',
        -- 'rust',
        'sql',
        'tmux',
        -- 'vim',
        'yaml',
        -- 'xml'
    },
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = false,
        keymaps = {
            init_selection = "<CR>", -- set to `false` to disable one of the mappings
            node_incremental = "<CR>",
            scope_incremental = false,
            node_decremental = "<ESC>",
        },
    },
}
