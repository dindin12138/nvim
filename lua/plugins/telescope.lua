return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "ahmedkhalf/project.nvim",
      event = "VeryLazy",
      opts = {
        detection_methods = { "pattern" },
        patterns = {
          "README.md",
          "Cargo.toml",
          ".sln",
          ".git",
          "_darcs",
          ".hg",
          ".bzr",
          ".svn",
          "Makefile",
        },
        exclude_dirs = { "~/.local/*" },
      },
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
  opts = {
    defaults = {
      layout_config = {
        horizontal = { prompt_position = "top", results_width = 0.6 },
        vertical = { mirror = false },
      },
      sorting_strategy = "ascending",
      mappings = {
        i = {
          ["<C-h>"] = "which_key",
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
          ["<Down>"] = "move_selection_next",
          ["<Up>"] = "move_selection_previous",
          ["<C-n>"] = "cycle_history_next",
          ["<C-p>"] = "cycle_history_prev",
          ["<C-c>"] = "close",
          ["<C-u>"] = "preview_scrolling_up",
          ["<C-d>"] = "preview_scrolling_down",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("projects")
    require("telescope").load_extension("fzf")
  end,
}
