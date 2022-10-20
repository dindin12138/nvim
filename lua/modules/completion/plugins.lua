local plugin = require('core.pack').register_plugin
local conf = require('modules.completion.config')

plugin {
    'neovim/nvim-lspconfig',
    ft = { 'lua', 'c', 'cpp', 'python', 'rust', 'json', 'sh' },
    config = conf.nvim_lsp
}

plugin { 'williamboman/mason-lspconfig.nvim' }

plugin {
    'rafamadriz/friendly-snippets',
    module = { "cmp", "cmp_nvim_lsp" },
    event = "InsertEnter"
}

plugin {
    'hrsh7th/nvim-cmp',
    after = "friendly-snippets",
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
    config = conf.luasnip
}

plugin {
    'glepnir/lspsaga.nvim',
    cmd = 'Lspsaga'
}

plugin {
    'ray-x/lsp_signature.nvim',
    after = "nvim-lspconfig",
    config = conf.lsp_signature
}

plugin {
    'stevearc/aerial.nvim',
    cmd = 'AerialToggle',
    config = conf.aerial
}
