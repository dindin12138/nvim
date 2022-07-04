local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    { 'nvim-lua/popup.nvim', opt = true },
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'nvim-telescope/telescope-fzy-native.nvim', opt = true },
    { 'LinArcX/telescope-env.nvim', opt = true }
  }
}

plugin { 'ahmedkhalf/project.nvim', config = conf.project }

plugin { 'dstein64/vim-startuptime', cmd = 'StartupTime' }

plugin {
  'nathom/filetype.nvim',
  opt = false,
  config = conf.filetype
}
