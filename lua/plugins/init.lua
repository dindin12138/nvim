return {
    {
        'nvim-tree/nvim-web-devicons',
        lazy = true,
    },
    {
        'stevearc/dressing.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'nvim-lualine/lualine.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = require("plugins.configs.lualine")
    },
    {
        'j-hui/fidget.nvim',
        tag = "legacy",
        event = "LspAttach",
        opts = {},
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'rcarriga/nvim-notify',
        event = 'VeryLazy',
        opts = { stages = "static" },
        config = function(_, opts)
            require("notify").setup(opts)
            vim.notify = require("notify")
        end
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false,
        priority = 1000,
        config = function()
            vim.api.nvim_command "colorscheme catppuccin"
        end
    },
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        opts = require("plugins.configs.dashboard")
    },
    {
        'akinsho/bufferline.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = {
            { 'famiu/bufdelete.nvim',       cmd = 'Bdelete' },
            { 'nvim-tree/nvim-web-devicons' }
        },
        opts = require("plugins.configs.bufferline")
    },
    {
        'nvim-lua/plenary.nvim',
        lazy = true
    },
    {
        'nvim-tree/nvim-tree.lua',
        cmd = 'NvimTreeToggle',
        opts = require("plugins.configs.nvim-tree")
    },
    {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = require("plugins.configs.telescope"),
        config = function(_, opts)
            require('telescope').setup(opts)
            require('telescope').load_extension('projects')
        end
    },
    {
        'williamboman/mason.nvim',
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        build = ":MasonUpdate",
        opts = require("plugins.configs.mason"),
        config = function(_, opts)
            require("mason").setup(opts)
            local mr = require("mason-registry")
            local function ensure_installed()
                for _, tool in ipairs(opts.ensure_installed) do
                    local p = mr.get_package(tool)
                    if not p:is_installed() then
                        p:install()
                    end
                end
            end
            if mr.refresh then
                mr.refresh(ensure_installed)
            else
                ensure_installed()
            end
        end,
    },
    {
        'ahmedkhalf/project.nvim',
        -- event = 'VeryLazy',
        opts = require("plugins.configs.project"),
        config = function(_, opts)
            require("project_nvim").setup(opts)
        end,
    },
    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = require("plugins.configs.gitsigns"),
    },
    {
        'folke/which-key.nvim',
        event = "VeryLazy",
        config = function()
            local wk = require("which-key")
            local keymap = require("core.keymap")
            wk.register(keymap.normal_key, { mode = "n" })
            wk.register(keymap.insert_key, { mode = "i" })
            wk.register(keymap.visual_key, { mode = "v" })
            wk.register(keymap.terminal_key, { mode = "t" })
        end
    },
    {
        "folke/flash.nvim",
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            {
                "S",
                mode = { "n", "o", "x" },
                function() require("flash").treesitter() end,
                desc =
                "Flash Treesitter"
            },
            {
                "r",
                mode = "o",
                function() require("flash").remote() end,
                desc =
                "Remote Flash"
            },
            {
                "R",
                mode = { "o", "x" },
                function() require("flash").treesitter_search() end,
                desc =
                "Treesitter Search"
            },
            {
                "<c-s>",
                mode = { "c" },
                function() require("flash").toggle() end,
                desc =
                "Toggle Flash Search"
            },
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" },
        event = { "BufReadPost", "BufNewFile" },
        build = ':TSUpdate',
        opts = require("plugins.configs.nvim-treesitter"),
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end
    },
    {
        'numToStr/Comment.nvim',
        keys = {
            { "<C-/>",     function() require("Comment.api").toggle.linewise.current() end, desc = "Toggle comment" },
            { "<leader>/", function() require("Comment.api").toggle.linewise.current() end, desc = "Toggle comment" },
        },
        config = true
    },
    {
        'folke/todo-comments.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        config = true
    },
    {
        'williamboman/mason-lspconfig.nvim',
        lazy = true,
    },
    {
        'folke/neodev.nvim',
        lazy = true,
        opt = {}
    },
    {
        'neovim/nvim-lspconfig',
        ft = { 'lua', 'c', 'cpp', 'python', 'rust', 'json', 'sh', 'go' },
        config = function()
            require("neodev").setup()
            require("mason-lspconfig").setup()
            require("plugins.configs.lsp")
        end
    },
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lua',
            'f3fora/cmp-spell',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            require("plugins.configs.nvim-cmp")
        end,
    },
    {
        'L3MON4D3/LuaSnip',
        lazy = true,
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
                require("luasnip.loaders.from_vscode").lazy_load({ paths = { './snippets/' } })
            end,
        },
        opts = {
            history = true,
            updateevents = "TextChanged,TextChangedI",
        },
    },
    {
        'simrat39/symbols-outline.nvim',
        cmd = 'SymbolsOutline',
        config = true
    },
    {
        'ray-x/lsp_signature.nvim',
        ft = { 'lua', 'c', 'cpp', 'python', 'rust', 'json', 'sh', 'go' },
        config = true,
    },
    {
        'folke/trouble.nvim',
        cmd = { 'TroubleToggle', 'Trouble' },
        config = true
    }
}
