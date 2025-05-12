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
    use 'jiangmiao/auto-pairs'
    use 'mg979/vim-visual-multi'
    use {
        'numToStr/Comment.nvim',
        config = function()
          require('Comment').setup()
        end
    }

    -- Completions
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'

    -- Look and feel
    use 'machakann/vim-highlightedyank'
    use 'morhetz/gruvbox'
    use 'ap/vim-css-color'
    use 'kyazdani42/nvim-web-devicons'

    -- Highlighting
    use 'nvim-treesitter/nvim-treesitter'
    use({
        'MeanderingProgrammer/render-markdown.nvim',
        after = { 'nvim-treesitter' },
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('render-markdown').setup({})
        end,
    })

    -- Widgets
    use 'nvim-lualine/lualine.nvim'
    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('bufferline').setup({})
        end
    }

    -- Other
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    use {
        'vodchella/hodur.nvim',
        config = function()
            require('hodur').setup({
                key = "<C-g>"
            })
        end
    }

    if packer_bootstrap then
      require('packer').sync()
    end

end)
