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
return M
