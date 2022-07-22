local plugin = require('core.pack').register_plugin
local conf = require('modules.completion.config')

plugin {
    'neovim/nvim-lspconfig',
    ft = { 'lua', 'c', 'cpp' },
    config = conf.nvim_lsp
}

plugin {
    'hrsh7th/nvim-cmp',
    event = 'BufRead',
    config = conf.nvim_cmp,
    requires = {
        { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-lspconfig' },
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
        { 'f3fora/cmp-spell', after = 'nvim-cmp' },
        { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' },
    },
}

plugin {
    'L3MON4D3/LuaSnip',
    after = 'nvim-cmp',
    config = conf.luasnip,
    requires = { 'rafamadriz/friendly-snippets', after = 'LuaSnip' }
}

plugin {
    'onsails/lspkind.nvim',
    config = conf.lspkind,
}

plugin {
    'glepnir/lspsaga.nvim',
    cmd = 'Lspsaga'
}

plugin {
    'ray-x/lsp_signature.nvim',
    event = 'BufRead',
    config = conf.lsp_signature
}

plugin {
    'stevearc/aerial.nvim',
    after = 'nvim-lspconfig',
    config = conf.aerial
}
