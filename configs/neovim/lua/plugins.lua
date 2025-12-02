local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    --
    use 'wbthomason/packer.nvim'

    -- Text editing
    use 'tpope/vim-sleuth'
    use 'mg979/vim-visual-multi'
    use {
        'numToStr/Comment.nvim',
        config = function()
          require('Comment').setup()
        end
    }
    use {
        'nvim-mini/mini.surround',
        config = function()
          require('mini.surround').setup()
        end
    }
    use {
        'nvim-mini/mini.pairs',
        config = function()
          require('mini.pairs').setup({
              mappings = {
                ['<'] = { action = 'open',  pair = '<>', neigh_pattern = '[^\\].' },
                ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
              }
          })
        end
    }
    use({
        'Wansmer/treesj',
        requires = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
          require('treesj').setup({
              use_default_keymaps = false,
          })
        end,
    })

    -- Completions
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    -- use 'hrsh7th/cmp-nvim-lua'
    -- use 'saadparwaiz1/cmp_luasnip'
    -- use 'L3MON4D3/LuaSnip'

    -- Look and feel
    use 'machakann/vim-highlightedyank'
    use 'morhetz/gruvbox'
    use 'ap/vim-css-color'
    use 'kyazdani42/nvim-web-devicons'

    use 'rcarriga/nvim-notify'
    vim.notify = require("notify")

    -- Highlighting
    use 'nvim-treesitter/nvim-treesitter'
    use {
      'folke/todo-comments.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function()
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
      end
    }
    -- use({
    --     'MeanderingProgrammer/render-markdown.nvim',
    --     after = { 'nvim-treesitter' },
    --     requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    --     config = function()
    --         require('render-markdown').setup({})
    --     end,
    -- })

    -- Widgets
    use 'vimpostor/vim-tpipeline'
    use 'nvim-lualine/lualine.nvim'
    use {
        'vodchella/quicker.nvim',
        config = function()
          require('quicker').setup()
        end
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('bufferline').setup({})
        end
    }
    use({
        'kdheepak/lazygit.nvim',
        -- optional for floating window border decoration
        requires = {
            'nvim-lua/plenary.nvim',
        },
    })

    -- File browser
    use {
        'stevearc/oil.nvim',
        config = function()
            require('oil').setup({
                default_file_explorer = true,
                view_options = {
                    show_hidden = true,
                    is_hidden_file = function(name, bufnr)
                      local m = name:match("^%.")
                      return m ~= nil
                    end,
                }
            })
        end,
    }

    -- LSP and related
    use 'mfussenegger/nvim-jdtls'
    use {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    }
    use {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        after = 'mason.nvim',
        config = function()
            require('mason-tool-installer').setup {
                ensure_installed = {
                    'ocamlformat',
                },
            }
        end
    }
    use {
        'williamboman/mason-lspconfig.nvim',
        after = 'mason.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'jdtls',
                    'ocamllsp',
                },
                automatic_installation = true,
            })
        end
    }

    -- DAP (отладчик)
    use {
        'mfussenegger/nvim-dap',
        config = function()
            require('dap').configurations.java = {
              {
                type = 'java',
                request = 'attach',
                name = "Attach to JVM",
                hostName = "localhost",
                port = 5005
              },
            }
        end
    }
    use {
        'rcarriga/nvim-dap-ui',
        requires = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    }
    -- Нифига этот Java-адаптер не ставится через конфиг, поставил руками через :Mason
    -- use {  -- Mason для DAP
    --     'jay-babu/mason-nvim-dap.nvim',
    --     after = 'mason.nvim',
    --     requires = { 'mfussenegger/nvim-dap' },
    --     config = function()
    --         require('mason-nvim-dap').setup({
    --             ensure_installed = { 'java' },  -- Java Debug Adapter
    --             automatic_installation = true,
    --         })
    --     end
    -- }

    -- Fuzzy searching
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'vodchella/fzf-lsp.nvim'

    -- Database support
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'
    use 'kristijanhusak/vim-dadbod-completion'

    -- Quick jumpling
    use {
      'smoka7/hop.nvim',
      tag = '*',
      config = function()
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
    }

    -- Other
    use 'szw/vim-maximizer'
    use {
        'vodchella/hodur.nvim',
        config = function()
            require('hodur').setup({})
        end
    }

    if packer_bootstrap then
      require('packer').sync()
    end

end)
