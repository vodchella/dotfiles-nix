require'nvim-treesitter.configs'.setup {
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
        -- 'markdown',
        'nix',
        -- 'ocaml',
        -- 'pascal',
        -- 'python',
        -- 'regex',
        -- 'rust',
        -- 'sql',
        'tmux',
        -- 'vim',
        -- 'yaml',
        -- 'xml'
    },
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>", -- set to `false` to disable one of the mappings
            node_incremental = "<CR>",
            scope_incremental = false,
            node_decremental = "<ESC>",
        },
    },
}
