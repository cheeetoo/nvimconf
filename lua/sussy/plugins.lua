return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --theme
    use {'ellisonleao/gruvbox.nvim',
    config = function ()
        vim.cmd [[colo gruvbox]]
    end}

  --lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
        require('sussy.plugins.lualine')
    end,
  }

  -- --icons
  use({
    'kyazdani42/nvim-web-devicons',
    config = function()
        require('nvim-web-devicons').setup()
    end,
  })

    --lsp
    use({
        'neovim/nvim-lspconfig',
        requires = { 'hrsh7th/nvim-cmp', 'hrsh7th/cmp-nvim-lsp', 'saadparwaiz1/cmp_luasnip'},
        config = function()
            require('sussy.plugins.lsp')
        end,
    })

  -- terminal
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require'toggleterm'.setup {
            shade_terminals = false
        }
    end}

  --close pairs
  use {"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  --snippests
  use({"L3MON4D3/LuaSnip"})

    --comment toggle
    use {
        'numToStr/Comment.nvim',
        config = function()
            require("sussy.plugins.comment")
        end
    }

    -- file explorer
    use {'nvim-tree/nvim-tree.lua', tag = 'nightly', config = function ()
        require('nvim-tree').setup()
    end}

    -- top bar
    use {'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function ()
            require"sussy.plugins.bufferline"
        end
    }

    --more snippets
    use "rafamadriz/friendly-snippets"
    -- require("luasnip/loaders/from_vscode").lazy_load()

    -- use {'folke/tokyonight.nvim'}

    use {'norcalli/nvim-colorizer.lua',
    config = function ()
            require'colorizer'.setup()
    end}

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'}, {'nvim-treesitter/nvim-treesitter'} },
      config = function ()
        require'telescope'.setup()
      end
    }

    use {'sainnhe/gruvbox-material'}

    -- git plugin
    use 'kdheepak/lazygit.nvim'

    --gitsings
    use {
      'lewis6991/gitsigns.nvim',
      config = function ()
        require('gitsigns').setup()
      end
    }

    --markdown
    -- install without yarn or npm
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})

use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
end)
