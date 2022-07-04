local plugin = require('core.pack').register_plugin
local conf = require('modules.editor.config')

plugin {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    run = ':TSUpdate',
    config = conf.nvim_treesitter
}

plugin {
    'windwp/nvim-autopairs',
    event = "BufRead",
    config = conf.autopairs
}

plugin {
    'numToStr/Comment.nvim',
    event = "BufRead",
    config = conf.comment
}
