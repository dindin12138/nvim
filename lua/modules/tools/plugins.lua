local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin {
    'nvim-tree/nvim-tree.lua',
    cmd = 'NvimTreeToggle',
    config = conf.nvim_tree,
    requires = 'nvim-tree/nvim-web-devicons'
}

plugin { 'nvim-lua/plenary.nvim' }

plugin {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    config = conf.telescope
}

plugin { 'ahmedkhalf/project.nvim', cmd = 'Telescope', config = conf.project }

plugin { 'dstein64/vim-startuptime', cmd = 'StartupTime' }

plugin {
    'nathom/filetype.nvim',
    config = conf.filetype
}

plugin {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPost", "BufNewFile" },
    config = conf.gitsigns
}

plugin {
    'folke/which-key.nvim',
    config = conf.which_key
}

plugin {
    'williamboman/mason.nvim',
    -- cmd = 'Mason',
    config = conf.mason
}

plugin {
    'akinsho/toggleterm.nvim',
    tag = 'v2.*',
    config = conf.toggleterm
}

-- plugin {
--     'Pocco81/auto-save.nvim',
--     event = 'BufRead'
-- }

-- plugin {
--     'rmagatti/auto-session',
--     cmd = { "SaveSession", "RestoreSession", "DeleteSession" },
--     config = conf.auto_session
-- }
