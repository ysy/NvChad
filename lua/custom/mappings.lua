M = {}

-- M.substitube = {
--   plugin = true,
--   n = {
--     ['s'] = {require('substitube').operator, "test"}
--   }
-- }
--

M.telescope = {
  n = {
    ["<leader><leader>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
  }
}

local wt_cmd = ":lua save_cursor = vim.fn.getpos(\".\")  vim.cmd([[%s/\\s\\+$//e]]) vim.fn.setpos(\".\", save_cursor)  vim.cmd([[noh]])<CR> :clear <CR>"

M.custom = {
  n = {
    ["<leader>rl"] = { "<cmd>edit!<CR>", "reload file" },
    ["<leader>wt"] = {wt_cmd, "trim trailing whitespaces" },
  }
}

return M
