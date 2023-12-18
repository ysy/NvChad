M = {}

-- M.substitube = {
--   plugin = true,
--   n = {
--     ['s'] = {require('substitube').operator, "test"}
--   }
-- }
--

M.disabled = {
    n = {
        ["<leader>n"] = "",
    }
}

M.telescope = {
  n = {
    ["<leader><leader>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fs"] = {"<cmd>Telescope grep_string<CR>", "Find string under cursor in cwd"},
  }
}

M.lspconfig = {
    n = {
        ["gr"] = {
          "<cmd>Telescope lsp_references<cr>",
          "LSP references",
        }
    },
}

local wt_cmd = ":lua save_cursor = vim.fn.getpos(\".\")  vim.cmd([[%s/\\s\\+$//e]]) vim.fn.setpos(\".\", save_cursor)  vim.cmd([[noh]])<CR> :clear <CR>"

M.custom = {
  n = {
    ["<leader>rl"] = { "<cmd>edit!<CR>", "reload file" },
    ["<leader>wt"] = {wt_cmd, "trim trailing whitespaces" },
    ["<leader>nh"] = { "<cmd>nohl<CR>", "Clear search hightlights" },
    ['<C-j>'] = {"<C-d>", opts = {noremap = true}},
    ['<C-k>'] = {"<C-u>", opts = {noremap = true}},

    -- disable arrow keys
    ["<Down>"] = {"<Nop>", "arrow key disabled" },
    ["<Up>"] = {"<Nop>", "arrow key disabled" },
    ["<Left>"] = {"<Nop>", "arrow key disabled" },
    ["<Right>"] = {"<Nop>", "arrow key disabled" },
  },

  i = {
    -- disable arrow keys
    ["jk"] = { "<ESC>", "Exit insert mode with jk" },
    ["<Down>"] = {"<Nop>", "arrow key disabled" },
    ["<Up>"] = {"<Nop>", "arrow key disabled" },
    ["<Left>"] = {"<Nop>", "arrow key disabled" },
    ["<Right>"] = {"<Nop>", "arrow key disabled" },
  },
  v = {
    -- disable arrow keys
    ["<Down>"] = {"<Nop>", "arrow key disabled" },
    ["<Up>"] = {"<Nop>", "arrow key disabled" },
    ["<Left>"] = {"<Nop>", "arrow key disabled" },
    ["<Right>"] = {"<Nop>", "arrow key disabled" },
  },
  x = {
    -- disable arrow keys
    ["<Down>"] = {"<Nop>", "arrow key disabled" },
    ["<Up>"] = {"<Nop>", "arrow key disabled" },
    ["<Left>"] = {"<Nop>", "arrow key disabled" },
    ["<Right>"] = {"<Nop>", "arrow key disabled" },
  },
}

return M
