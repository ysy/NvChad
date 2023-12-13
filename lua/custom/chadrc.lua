---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'catppuccin',
  nvdash = {
    -- load_on_startup = true
  },
  hl_override = {
        Visual = {
             bg = {"grey", 2}
        },
        -- Normal = {
        --     bg = {"black", 0},
        -- }
    }
}
M.plugins = 'custom.plugins'
M.mappings = require 'custom.mappings'
return M
