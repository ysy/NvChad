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
    ["<leader>ws"] = {"<cmd>Telescope lsp_workspace_symbols<CR>", "Find symbol in worksapce"},
    ["<leader>ds"] = {"<cmd>Telescope lsp_document_symbols<CR>", "Find symbol in document"},
    ["<leader>rs"] = {"<cmd>Telescope session-lens search_session<CR>", "Find sessions"},
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

local function get_batch_file(name)
    local paths = {"./", "./tools/", "./dusun/tools/"}

    for i=1, #paths do
       local path = paths[i] .. name
       local ok, _ = vim.loop.fs_stat(path)
       if ok then
            return path
       end
    end
    return nil
end

 _BUILD_YSY_ = function ()
    local path = get_batch_file("build.bat")
    if path == nil then
        print("build.bat does not exists")
        return
    end
    vim.cmd('1TermExec cmd="'.. path .. '"')
end

_FLASH_YSY_ = function ()
    local path = get_batch_file("flash.bat")
    if path == nil then
        print("flash.bat does not exists")
        return
    end
    vim.cmd('1TermExec cmd="'.. path .. '"')
end


M.custom = {
  n = {
    ["<leader>rl"] = { "<cmd>edit!<CR>", "reload file" },
    ["<leader>wt"] = {wt_cmd, "trim trailing whitespaces" },
    ["<leader>nh"] = { "<cmd>nohl<CR>", "Clear search hightlights" },
    -- ['<C-j>'] = {"<C-d>", opts = {noremap = true}},
    -- ['<C-k>'] = {"<C-u>", opts = {noremap = true}},
    ["<leader>tb"] = {"<cmd>lua _BUILD_YSY_()<CR>", "Build project"},
    ["<leader>tf"] = {"<cmd>lua _FLASH_YSY_()<CR>", "Flash project"},
    ["<leader>ts"] = {"<cmd>2ToggleTerm<CR>", "Show serial monitor terminal"},
    ["<leader>gg"] = {"<cmd>LazyGit<CR>", "Show LazyGit"},
    -- disable arrow keys
    ["<Down>"] = {"<Nop>", "arrow key disabled" },
    ["<Up>"] = {"<Nop>", "arrow key disabled" },
    ["<Left>"] = {"<Nop>", "arrow key disabled" },
    ["<Right>"] = {"<Nop>", "arrow key disabled" },
  },

  i = {
    -- disable arrow keys
    -- ["jk"] = { "<ESC>", "Exit insert mode with jk" },
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
