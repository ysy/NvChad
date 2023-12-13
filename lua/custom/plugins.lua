local plugins = 
{

  -- substitute
  {
    "gbprod/substitute.nvim",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },

    --enabled = true,
    init = function ()
      require('core.mappings').substitute = {
        n = {
          ['<leader>s'] = {require('substitute').operator, 'substitute motion,, replace text with yanked', opts = {noremap = true}}
        },
        x = {
          ['<leader>s'] = {require('substitute').visual, 'substitute motion,, replace text with yanked', opts = {noremap = true}}
        }
      }

      require("core.utils").load_mappings('substitute')
    end,
  },


  -- Leap
  {
    "ggandor/leap.nvim",
    -- enabled = false,
    opts = {

    },

    init = function ()
      require("leap").add_default_mappings()
    end
  },

  -- Syntax Highlight
  {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          -- defaults
          "vim",
          "lua",

          -- web dev
          -- "html",
          -- "css",
          -- "javascript",
          -- "typescript",
          -- "tsx",
          "json",
          -- "vue", "svelte",

         -- low level
          "c",
          -- "zig"
          "python",
        },
      },
    },

    -- LSP Config
    {
      "neovim/nvim-lspconfig",
       config = function()
          require "plugins.configs.lspconfig"
          require "custom.configs.lspconfig"
       end,
    },
    -- LSP Config->mason
    -- :MasonInstallAll
    {
    "williamboman/mason.nvim",
        opts = {
          ensure_installed = {
            "lua-language-server",
            "prettier",
            "stylua",
            "clangd",
            "pyright",
          },
        },
    }
}

return plugins
