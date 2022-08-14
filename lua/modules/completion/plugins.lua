local plugin = require('core.pack').register_plugin
local conf = require('modules.completion.config')

plugin {
    'neovim/nvim-lspconfig',
    ft = { 'lua', 'c', 'cpp', 'python', 'rust', 'json', 'sh' },
    config = conf.nvim_lsp
}

plugin { 'williamboman/nvim-lsp-installer' }

plugin {
    'hrsh7th/nvim-cmp',
    event = 'BufReadPost',
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
    requires = { 'rafamadriz/friendly-snippets' }
}

plugin {
    'onsails/lspkind.nvim',
    event = 'BufReadPost',
    config = conf.lspkind,
}

plugin {
    'glepnir/lspsaga.nvim',
    cmd = 'Lspsaga',
}

plugin {
    'ray-x/lsp_signature.nvim',
    after = "nvim-lspconfig",
    config = conf.lsp_signature
}

plugin {
    'stevearc/aerial.nvim',
    after = 'nvim-lspconfig',
    config = conf.aerial
}
