local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin {
    'nvim-tree/nvim-tree.lua',
    cmd = 'NvimTreeToggle',
    config = conf.nvim_tree,
    requires = 'nvim-tree/nvim-web-devicons'
}

plugin { 'nvim-lua/plenary.nvim', module = "plenary" }

plugin {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    after = 'project.nvim',
    config = conf.telescope
}

plugin { 'ahmedkhalf/project.nvim', module = 'telescope', config = conf.project }

plugin { 'dstein64/vim-startuptime', cmd = 'StartupTime' }

plugin {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = conf.gitsigns
}

plugin {
    'folke/which-key.nvim',
    config = conf.which_key
}

plugin {
    'williamboman/mason.nvim',
    module = 'mason',
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    config = conf.mason
}

plugin {
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = conf.toggleterm
}

plugin { 'lewis6991/impatient.nvim' }
