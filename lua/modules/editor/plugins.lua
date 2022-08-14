local plugin = require('core.pack').register_plugin
local conf = require('modules.editor.config')

plugin {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufReadPost',
    run = ':TSUpdate',
    config = conf.nvim_treesitter
}

plugin {
    'p00f/nvim-ts-rainbow',
    event = 'BufReadPost',
    after = 'nvim-treesitter'
}

plugin {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = conf.autopairs
}

plugin {
    'numToStr/Comment.nvim',
    event = 'BufReadPost',
    config = conf.comment
}
