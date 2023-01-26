local ui_config = require('plugins.configs.ui')
local tools_config = require('plugins.configs.tools')
local editor_config = require('plugins.configs.editor')
local completion_config = require('plugins.configs.completion')
local M = {
    ---------------------------------------- UI ----------------------------------------
    { 'catppuccin/nvim', name = 'catppuccin', config = ui_config.catppuccin },
    { 'glepnir/dashboard-nvim', event = 'VimEnter', dependencies = 'nvim-tree/nvim-web-devicons',
        config = ui_config.dashboard },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    { 'nvim-lualine/lualine.nvim', event = { 'BufReadPost', 'BufNewFile' }, config = ui_config.lualine },
    { 'lukas-reineke/indent-blankline.nvim', event = { 'BufReadPost', 'BufNewFile' } },
    { 'rcarriga/nvim-notify', config = ui_config.notify },
    { 'akinsho/bufferline.nvim', event = { 'BufReadPost', 'BufNewFile' },
        dependencies = { 'famiu/bufdelete.nvim', cmd = 'Bdelete' }, config = ui_config.bufferline, },
    ---------------------------------------- TOOLS ----------------------------------------
    { 'nvim-tree/nvim-tree.lua', cmd = 'NvimTreeToggle', config = tools_config.nvim_tree,
        dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'nvim-telescope/telescope.nvim', cmd = 'Telescope', dependencies = 'nvim-lua/plenary.nvim',
        config = tools_config.telescope },
    { 'ahmedkhalf/project.nvim', config = tools_config.project },
    { 'lewis6991/gitsigns.nvim', event = { 'BufReadPost', 'BufNewFile' }, config = tools_config.gitsigns },
    { 'folke/which-key.nvim', config = tools_config.which_key },
    { 'williamboman/mason.nvim',
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        config = tools_config.mason },
    { 'NvChad/nvterm', lazy = true, config = tools_config.nvterm },
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
    { 'hrsh7th/nvim-cmp', event = "InsertEnter", config = completion_config.nvim_cmp,
        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lua', 'f3fora/cmp-spell', 'saadparwaiz1/cmp_luasnip', } },
    { 'L3MON4D3/LuaSnip', lazy = true, dependencies = 'rafamadriz/friendly-snippets', config = completion_config.luasnip },
    { 'ray-x/lsp_signature.nvim', ft = { 'lua', 'c', 'cpp', 'python', 'rust', 'json', 'sh' },
        config = completion_config.lsp_signature },
    { 'simrat39/symbols-outline.nvim', cmd = 'SymbolsOutline', config = completion_config.symbols_outline },
    { 'folke/trouble.nvim', cmd = 'TroubleToggle', dependencies = 'nvim-tree/nvim-web-devicons',
        config = completion_config.trouble }
}
return M
