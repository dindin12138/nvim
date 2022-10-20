local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

plugin {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = conf.catppuccin
}

plugin { 'glepnir/dashboard-nvim', config = conf.dashboard }

plugin { 'nvim-tree/nvim-web-devicons', module = 'nvim-web-devicons' }

plugin {
    'nvim-lualine/lualine.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = conf.lualine
}

plugin {
    'akinsho/bufferline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    requires = { 'famiu/bufdelete.nvim', cmd = 'Bdelete' },
    config = conf.bufferline
}

plugin {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = conf.indent_blankline
}

plugin {
    'rcarriga/nvim-notify',
    config = conf.notify
}
