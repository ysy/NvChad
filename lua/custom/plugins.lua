local plugins =
{
  --Disable nvterm, instead use toggleterm
  {
    "NvChad/nvterm",
     enabled = false
  },

  -- Toggle term
  {
    'akinsho/toggleterm.nvim', version = "*",

    init = function ()
        local is_windows = vim.fn.has("win32") == 1
        local opts = {
            open_mapping = "<C-\\>",
            start_in_insert = true,
            direction = 'float',
        }

        if is_windows then
            if vim.fn.executable('C:\\msys64\\msys2_shell.cmd') then
                opts.shell = "C:\\msys64\\msys2_shell.cmd -defterm -here -no-start -use-full-path -ucrt64"
            else
                vim.notify("Warning: MSYS64 not installed, please install it in C:\\msys64")
           end
        end
        require("toggleterm").setup(opts)
    end
  },

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
          ['s'] = {require('substitute').operator, 'substitute motion, replace text with yanked', opts = {noremap = true}}
        },
        x = {
          ['s'] = {require('substitute').visual, 'substitute motion, replace text with yanked', opts = {noremap = true}}
        }
      }

      require("core.utils").load_mappings('substitute')
    end,
  },


  -- Leap
  {
    "ggandor/leap.nvim",
    enabled = false,
    opts = {

    },
    init = function ()
      require("leap").add_default_mappings()
    end
  },

  -- Hop
  {
    "smoka7/hop.nvim",
    version = "*",
    event = "VeryLazy",
    -- opts = {keys = 'etovxqpdygfblzhckisuran', term_seq_bias = 0.5},
    -- lazy = false,
    init = function ()
      require('core.mappings').hop = {
        n = {
          ['gs'] = {"<cmd>HopChar2<CR>", 'HopChar2', opts = {noremap = true}}
        },
      }
    end,
    -- lazy = false
    config = function ()
       require("hop").setup({keys = 'etovxqpdygfblzhckisuran', term_seq_bias = 0.5})
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
            "clang-format",
            "pyright",
          },
        },
    },

    -- LSP format
    {
        "jose-elias-alvarez/null-ls.nvim",
        enabled = false,
        event = "VeryLazy",
        opts = function()
          return require "custom.configs.null-ls"
        end,
    },

    --Dressing to cusotmize vim.input vim.select
    {
      "stevearc/dressing.nvim",
      event = "VeryLazy",
    },
    {
          "rmagatti/auto-session",
          lazy = false,
          config = function()
            local auto_session = require("auto-session")

            auto_session.setup({
              -- auto_restore_enabled = false,
              auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/", "~/" },
            })

            -- local keymap = vim.keymap
            -- keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
            -- keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
          end,
    },
    {
        'rmagatti/session-lens',
          dependencies = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
          config = function()
            require('session-lens').setup({--[[your custom config--]]})
          end
    },
    {
        'ThePrimeagen/vim-be-good',
        lazy = false,
        enabled = false
    },
    {
        "GustavoKatel/tasks.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        enabled = false,
        lazy = false,
        init = function ()
            local tasks = require("tasks")

            -- local source_npm = require("tasks.sources.npm")
            local source_tasksjson = require("tasks.sources.tasksjson")

            local builtin = require("tasks.sources.builtin")

            require("telescope").load_extension("tasks")

            tasks.setup({
                sources = {
                    -- npm = source_npm,
                    vscode = source_tasksjson,
                    utils = builtin.new_builtin_source({
                        -- sleep = {
                        --     fn = function(ctx)
                        --         local pasync = require("plenary.async")
                        --
                        --         pasync.util.sleep(10000)
                        --     end,
                        -- },
                        vim_cmd = {
                            vcmd = "echo 'ok'"
                        },

                        shell_cmd = {
                            cmd = "make test"
                        }
                    }),
                },
            })
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        event = 'VeryLazy',
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim"
        },

        config = function ()
            require("telescope").load_extension("lazygit")
        end
    },

    -- Hardtime
    {
       "m4xshen/hardtime.nvim",
       dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
       opts = {},
        lazy = false,
        config = function ()
            require("hardtime").setup()
        end
    },
}

return plugins
