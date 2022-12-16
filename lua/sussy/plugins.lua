-- bootstrapping
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

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    --lsp
    use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
      },
      config = function ()
        require("sussy.plugins.lsp")
      end
    }

    --theme
    use {'ellisonleao/gruvbox.nvim',
    config = function ()
        require('sussy.plugins.gruvbox')
    end}

    use {'rose-pine/neovim',
    config = function ()
        require('rose-pine').setup({
            dark_variant = 'moon'
        })
        vim.cmd [[colo rose-pine]]
    end}

    --lualine
    use {'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
        require('sussy.plugins.lualine') end,
    }

    -- --icons
    use({
    'kyazdani42/nvim-web-devicons',
    config = function()
        require('nvim-web-devicons').setup()
    end,
    })

    -- terminal
    use {"akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
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
        require('sussy.plugins.nvim-tree')
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
    use {"rafamadriz/friendly-snippets",
    config = function ()
        require('luasnip').filetype_extend("html", { "html" })
    end}
    -- require("luasnip/loaders/from_vscode").lazy_load()

    use {'folke/tokyonight.nvim'}

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
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
        -- zen mode
    -- Lua
    use {
      "folke/zen-mode.nvim",
      config = function()
          require('sussy.plugins.zen-mode')
      end
    }

    -- bootstrapping
    ensure_packer()
end)
