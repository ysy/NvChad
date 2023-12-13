local plugins = 
{
  {
    "gbprod/substitute.nvim",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },

    init = function ()
      require('core.mappings').substitute = {
        n = {
          ['s'] = {require('substitute').operator, 'substitute motion,, replace text with yanked', opts = {noremap = true}}
        },
        x = {
          ['s'] = {require('substitute').visual, 'substitute motion,, replace text with yanked', opts = {noremap = true}}
        }
      }

      require("core.utils").load_mappings('substitute')
    end,

    config = function ()
    end
  }
}

return plugins
