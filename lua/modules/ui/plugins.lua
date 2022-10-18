local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

plugin {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = conf.catppuccin
}

plugin { 'glepnir/dashboard-nvim', config = conf.dashboard }

plugin {
    'nvim-lualine/lualine.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = conf.lualine,
    requires = 'nvim-tree/nvim-web-devicons'
}

plugin {
    'akinsho/bufferline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = conf.bufferline,
    requires = {
        'nvim-tree/nvim-web-devicons',
        { 'famiu/bufdelete.nvim', cmd = 'Bdelete' }
    }
}

plugin {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPost',
    config = conf.indent_blankline
}

plugin {
    'rcarriga/nvim-notify',
    config = conf.notify
}
