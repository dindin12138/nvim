local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

plugin {
  "catppuccin/nvim",
  as = "catppuccin",
  config = conf.catppuccin
}

plugin { 'glepnir/dashboard-nvim', config = conf.dashboard }

plugin { 'nvim-lualine/lualine.nvim',
  config = conf.lualine,
  requires = 'kyazdani42/nvim-web-devicons'
}

plugin { 'kyazdani42/nvim-tree.lua',
  cmd = 'NvimTreeToggle',
  config = conf.nvim_tree,
  requires = 'kyazdani42/nvim-web-devicons'
}

plugin { 'akinsho/nvim-bufferline.lua',
  config = conf.nvim_bufferline,
  requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }
}
