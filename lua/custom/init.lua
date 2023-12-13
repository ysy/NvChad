
local opt = vim.opt

--Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})
-- local opts = { silent = true }
-- local keymap = vim.api.nvim_set_keymap
-- keymap("n", "<Left>", "<Nop>", opts)
-- keymap("n", "<Right>", "<Nop>", opts)
-- keymap("n", "<Up>", "<Nop>", opts)
-- keymap("n", "<Down>", "<Nop>", opts)
