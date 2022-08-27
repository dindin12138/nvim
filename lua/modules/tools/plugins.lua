local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin {
    'kyazdani42/nvim-tree.lua',
    cmd = 'NvimTreeToggle',
    config = conf.nvim_tree,
    requires = 'kyazdani42/nvim-web-devicons'
}

plugin {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    config = conf.telescope,
    requires = {
        { 'nvim-lua/popup.nvim', opt = true },
        { 'nvim-lua/plenary.nvim', opt = true },
        { 'nvim-telescope/telescope-fzy-native.nvim', opt = true },
        { 'LinArcX/telescope-env.nvim', opt = true },
        -- { 'rmagatti/session-lens', opt = true }
    }
}

plugin { 'ahmedkhalf/project.nvim', config = conf.project }

plugin { 'dstein64/vim-startuptime', cmd = 'StartupTime' }

plugin {
    'nathom/filetype.nvim',
    config = conf.filetype
}

plugin {
    'j-hui/fidget.nvim',
    event = 'BufReadPost',
    config = conf.fidget
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

-- plugin {
--     'Pocco81/auto-save.nvim',
--     event = 'BufRead'
-- }

-- plugin {
--     'rmagatti/auto-session',
--     cmd = { "SaveSession", "RestoreSession", "DeleteSession" },
--     config = conf.auto_session
-- }
