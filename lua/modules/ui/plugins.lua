local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

plugin {
    'catppuccin/nvim',
    as = 'catppuccin',
    commit = 'b5f2204b76320d04f618ea6643dce2edec67f915',
    config = conf.catppuccin
}

plugin { 'glepnir/dashboard-nvim', config = conf.dashboard }

plugin {
    'nvim-lualine/lualine.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = conf.lualine,
    requires = 'kyazdani42/nvim-web-devicons'
}

plugin {
    'kyazdani42/nvim-tree.lua',
    cmd = 'NvimTreeToggle',
    config = conf.nvim_tree,
    requires = 'kyazdani42/nvim-web-devicons'
}

plugin {
    'akinsho/bufferline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = conf.bufferline,
    requires = {
        'kyazdani42/nvim-web-devicons',
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
