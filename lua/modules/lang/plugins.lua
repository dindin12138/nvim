local plugin = require('core.pack').register_plugin
local conf = require('modules.lang.config')

plugin {
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  config = conf.nvim_treesitter
}