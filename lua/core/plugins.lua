local ui_config = require('modules.ui.config')
local tools_config = require('modules.tools.config')
local editor_config = require('modules.editor.config')
local completion_config = require('modules.completion.config')
local M = {
    ---------------------------------------- UI ----------------------------------------
    { 'catppuccin/nvim', name = 'catppuccin', config = ui_config.catppuccin },
    { 'glepnir/dashboard-nvim', config = ui_config.dashboard },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    { 'nvim-lualine/lualine.nvim', event = { 'BufReadPost', 'BufNewFile' }, config = ui_config.lualine },
    { 'lukas-reineke/indent-blankline.nvim', event = { 'BufReadPost', 'BufNewFile' } },
    { 'rcarriga/nvim-notify', config = ui_config.notify },
    { 'akinsho/bufferline.nvim', event = { 'BufReadPost', 'BufNewFile' },
        dependencies = { 'famiu/bufdelete.nvim', cmd = 'Bdelete' }, config = ui_config.bufferline, },
    { 'SmiteshP/nvim-navic', ft = { 'lua', 'c', 'cpp', 'python', 'rust', 'json', 'sh' }, config = ui_config.navic },
    ---------------------------------------- TOOLS ----------------------------------------
    { 'nvim-tree/nvim-tree.lua', cmd = 'NvimTreeToggle', config = tools_config.nvim_tree,
        dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'nvim-telescope/telescope.nvim', cmd = 'Telescope', dependencies = 'nvim-lua/plenary.nvim',
        config = tools_config.telescope },
    { 'ahmedkhalf/project.nvim', config = tools_config.project },
    { 'dstein64/vim-startuptime', cmd = 'StartupTime' },
    { 'lewis6991/gitsigns.nvim', event = { 'BufReadPost', 'BufNewFile' }, config = tools_config.gitsigns },
    { 'folke/which-key.nvim', config = tools_config.which_key },
    { 'williamboman/mason.nvim',
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        config = tools_config.mason },
    { 'akinsho/toggleterm.nvim', enabled = false, tag = '*', config = tools_config.toggleterm },
    ---------------------------------------- EDITOR ----------------------------------------
    { 'nvim-treesitter/nvim-treesitter',
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" },
        build = ':TSUpdate', config = editor_config.nvim_treesitter },
    { 'p00f/nvim-ts-rainbow', event = 'BufReadPost' },
    { 'windwp/nvim-autopairs', event = "InsertEnter", config = editor_config.autopairs },
    { 'numToStr/Comment.nvim', event = { 'BufReadPost', 'BufNewFile' }, config = editor_config.comment },
    { 'phaazon/hop.nvim', branch = 'v2', cmd = { 'HopWord', 'HopLine', 'HopChar1', 'HopChar2' },
        config = editor_config.hop },
    { 'folke/todo-comments.nvim', event = { 'BufReadPost', 'BufNewFile' }, config = editor_config.todo },
    ---------------------------------------- COMPLETION ----------------------------------------
    { 'neovim/nvim-lspconfig', ft = { 'lua', 'c', 'cpp', 'python', 'rust', 'json', 'sh' },
        config = completion_config.nvim_lsp },
    { 'williamboman/mason-lspconfig.nvim', lazy = true },
    { 'rafamadriz/friendly-snippets', event = "InsertEnter" },
    { 'hrsh7th/nvim-cmp', event = "InsertEnter", config = completion_config.nvim_cmp,
        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lua', 'f3fora/cmp-spell', 'saadparwaiz1/cmp_luasnip', } },
    { 'L3MON4D3/LuaSnip', event = "InsertEnter", config = completion_config.luasnip },
    { 'glepnir/lspsaga.nvim', cmd = 'Lspsaga' },
    { 'ray-x/lsp_signature.nvim', ft = { 'lua', 'c', 'cpp', 'python', 'rust', 'json', 'sh' },
        config = completion_config.lsp_signature },
    { 'simrat39/symbols-outline.nvim', cmd = 'SymbolsOutline', config = completion_config.symbols_outline },
    { 'folke/trouble.nvim', cmd = 'TroubleToggle', dependencies = 'nvim-tree/nvim-web-devicons',
        config = completion_config.trouble }
}
return M
