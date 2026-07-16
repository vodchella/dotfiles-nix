vim.pack.add({
    -- Text editing
    'https://github.com/tpope/vim-sleuth',
    'https://github.com/mg979/vim-visual-multi',
    'https://github.com/junegunn/vim-easy-align',
    'https://github.com/numToStr/Comment.nvim',
    'https://github.com/nvim-mini/mini.pairs',
    'https://github.com/nvim-mini/mini.surround',
    -- Text commands
    'https://github.com/nvim-mini/mini.ai',
    'https://github.com/nvim-mini/mini.operators',
    -- Completions
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/hrsh7th/cmp-buffer',
    'https://github.com/hrsh7th/cmp-path',
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    -- Look and feel
    'https://github.com/machakann/vim-highlightedyank',
    'https://github.com/morhetz/gruvbox',
    'https://github.com/ap/vim-css-color',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/rcarriga/nvim-notify',
    {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter',
        version = 'master',
    },
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/folke/todo-comments.nvim',
    -- Widgets
    'https://github.com/vimpostor/vim-tpipeline',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/kevinhwang91/nvim-bqf',
    'https://github.com/vodchella/quicker.nvim',
    'https://github.com/akinsho/bufferline.nvim',
    'https://github.com/tiagovla/scope.nvim',
    'https://github.com/neogitorg/neogit',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/MagicDuck/grug-far.nvim',
    -- LSP and related
    'https://github.com/mfussenegger/nvim-jdtls',
    'https://github.com/williamboman/mason.nvim',
    'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
    'https://github.com/williamboman/mason-lspconfig.nvim',
    -- DAP (отладчик)
    'https://github.com/mfussenegger/nvim-dap',
    'https://github.com/nvim-neotest/nvim-nio',
    'https://github.com/rcarriga/nvim-dap-ui',
    'https://github.com/jay-babu/mason-nvim-dap.nvim',
    -- Fuzzy searching
    'https://github.com/junegunn/fzf',
    'https://github.com/junegunn/fzf.vim',
    'https://github.com/vodchella/fzf-lsp.nvim',
    -- Quick jumpling
    'https://github.com/smoka7/hop.nvim',
    'https://github.com/vodchella/hodur.nvim',
            -- Database support
            -- 'tpope/vim-dadbod',
            -- 'kristijanhusak/vim-dadbod-ui',
            -- 'kristijanhusak/vim-dadbod-completion',
})

require('Comment').setup {}
require('mini.pairs').setup {}
require('mini.surround').setup {}
require('mini.ai').setup {}
require('mini.operators').setup {}
require('todo-comments').setup {
    highlight = {
        keyword = "bg",
        pattern = [[.*<(KEYWORDS)\s*]],
        comments_only = true,
    },
    search = {
        pattern = [[\b(KEYWORDS)\b]],
    },
}
require('quicker').setup {}
require('bufferline').setup {}
require('scope').setup {}
require('neogit').setup {
    disable_context_highlighting = true,
    floating = {
        width = 0.9,
        height = 0.9,
    },
    mappings = {
        popup = {
            ["Z"] = false,
            ["z"] = "StashPopup",
        }
    }
}
require('oil').setup {
    default_file_explorer = true,
    view_options = {
        show_hidden = true,
        is_hidden_file = function(name, bufnr)
            local m = name:match("^%.")
            return m ~= nil
        end,
    }
}
require('grug-far').setup {}
require('mason').setup {}
require('mason-tool-installer').setup {
    ensure_installed = {
        -- 'ocamlformat',
    },
}
require('mason-lspconfig').setup {
    ensure_installed = {
        'jdtls',
        -- 'ocamllsp',
    },
    automatic_installation = true,
}
require('dap').configurations.java = {
    -- {
    --   type = 'java',
    --   request = 'attach',
    --   name = "Attach to JVM",
    --   hostName = "localhost",
    --   port = 5005
    -- },
}
require('mason-nvim-dap').setup {
    ensure_installed = { 'java-debug-adapter', 'codelldb' },
    automatic_installation = true,
}
require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
require('hodur').setup {}

local ok, notify = pcall(require, 'notify')
if ok then
    vim.notify = notify
    notify.setup {
        background_colour = '#282828',
    }
end
