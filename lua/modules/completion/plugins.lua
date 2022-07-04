local plugin = require('core.pack').register_plugin
local conf = require('modules.completion.config')

plugin {
  'neovim/nvim-lspconfig',
  -- used filetype to lazyload lsp
  -- config your language filetype in here
  ft = { 'lua', 'c', 'cpp' },
  config = conf.nvim_lsp
}

plugin {
  'hrsh7th/nvim-cmp',
  -- event = 'BufReadPre',
  config = conf.nvim_cmp,
  requires = {
    { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-lspconfig' },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
    { 'saadparwaiz1/cmp_luasnip', after = "LuaSnip" }
  },
}

plugin {
  'L3MON4D3/LuaSnip',
  after = "nvim-cmp",
  config = conf.lua_snip,
  requires = 'rafamadriz/friendly-snippets'
}

plugin {
  'onsails/lspkind.nvim',
  config = conf.lspkind,
}

plugin {
  'glepnir/lspsaga.nvim',
  branch = "main",
  cmd = 'Lspsaga'
}
