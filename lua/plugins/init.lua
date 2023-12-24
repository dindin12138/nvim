return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = require("plugins.configs.lualine"),
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    opts = require("plugins.configs.indent-blankline"),
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = { stages = "static" },
    config = function(_, opts)
      vim.cmd([[
        highlight NotifyINFOBorder guifg=#89B4FA
        highlight NotifyINFOIcon guifg=#89B4FA
        highlight NotifyINFOTitle guifg=#89B4FA
      ]])
      require("notify").setup(opts)
      vim.notify = require("notify")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.api.nvim_command("colorscheme catppuccin")
    end,
  },
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    opts = require("plugins.configs.dashboard"),
  },
  {
    "akinsho/bufferline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      { "famiu/bufdelete.nvim", cmd = "Bdelete" },
      "nvim-tree/nvim-web-devicons",
    },
    opts = require("plugins.configs.bufferline"),
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      window = {
        width = 25,
        mappings = {
          ["l"] = "open",
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "ahmedkhalf/project.nvim",
        event = "VeryLazy",
        opts = require("plugins.configs.project"),
        config = function(_, opts)
          require("project_nvim").setup(opts)
        end,
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable("make") == 1,
      },
    },
    opts = require("plugins.configs.telescope"),
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("projects")
      require("telescope").load_extension("fzf")
    end,
  },

  {
    "williamboman/mason.nvim",
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
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = require("plugins.configs.gitsigns"),
  },
  {
    "folke/which-key.nvim",
    -- event = "VeryLazy",
    keys = "<leader>",
    opts = {
      window = {
        border = "rounded",
      },
      defaults = {
        mode = { "n", "v" },
        ["<leader>f"] = { name = "+Telescope" },
        ["<leader>s"] = { name = "+Split" },
        ["<leader>l"] = { name = "+LSP/Lazy" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
  {
    "folke/flash.nvim",
    opts = {},
    -- stylua: ignore start
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
    -- stylua: ignore end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" },
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = require("plugins.configs.nvim-treesitter"),
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "numToStr/Comment.nvim",
    -- stylua: ignore start
    keys = {
      { "<C-/>",     function() require("Comment.api").toggle.linewise.current() end, desc = "Toggle comment" },
      { "<leader>/", function() require("Comment.api").toggle.linewise.current() end, desc = "Toggle comment" },
    },
    -- stylua: ignore end
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = require("plugins.configs.todo-comments"),
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
  },
  {
    "folke/neodev.nvim",
    lazy = true,
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    ft = { "lua", "c", "cpp", "python", "rust", "sh", "go", "sql" },
    config = function()
      require("neodev").setup()
      require("mason-lspconfig").setup()
      require("plugins.configs.lsp")
    end,
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {},
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "f3fora/cmp-spell",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
    },
    config = function()
      require("plugins.configs.nvim-cmp")
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/" } })
      end,
    },
    opts = {
      history = true,
      updateevents = "TextChanged,TextChangedI",
    },
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    config = true,
  },
  {
    "stevearc/aerial.nvim",
    cmd = "AerialToggle",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      attach_mode = "global",
      backends = { "lsp", "treesitter", "markdown", "man" },
      show_guides = true,
      layout = { min_width = 28 },
      guides = {
        mid_item = "├╴",
        last_item = "└╴",
        nested_top = "│ ",
        whitespace = "  ",
      },
    },
  },
  {
    "ray-x/lsp_signature.nvim",
    ft = { "lua", "c", "cpp", "python", "rust", "sh", "go", "sql" },
    config = true,
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = true,
  },
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",
    -- stylua: ignore
    keys = { { mode = { "n" }, "<leader>lf", function() require("conform").format() end, desc = "Format" } },
    opts = require("plugins.configs.conform"),
  },
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      src = {
        cmp = { enabled = true },
      },
    },
  },
  {
    "Civitasv/cmake-tools.nvim",
    ft = { "c", "cpp" },
    opts = {},
  },
}
