local plugin = require('core.pack').register_plugin
local conf = require('modules.editor.config')

plugin {
    'nvim-treesitter/nvim-treesitter',
    module = "nvim-treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" },
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
    event = { 'BufReadPost', 'BufNewFile' },
    config = conf.comment
}

plugin {
    'phaazon/hop.nvim',
    branch = 'v2',
    cmd = { 'HopWord', 'HopLine', 'HopChar1' },
    config = conf.hop
}

plugin {
    'folke/todo-comments.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = conf.todo
}
