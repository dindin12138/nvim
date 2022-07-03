local config = {}

function config.telescope()
    if not packer_plugins['plenary.nvim'].loaded then
        vim.cmd [[packadd plenary.nvim]]
        vim.cmd [[packadd popup.nvim]]
        vim.cmd [[packadd telescope-fzy-native.nvim]]
        vim.cmd [[packadd telescope-file-browser.nvim]]
        vim.cmd [[packadd telescope-env.nvim]]
        vim.cmd [[packadd project.nvim]]
    end
    require('telescope').setup {
        defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
            initial_mode = "insert",
            layout_config = {
                horizontal = { prompt_position = "top", results_width = 0.6 },
                vertical = { mirror = false }
            },
            sorting_strategy = 'ascending',
            file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
            grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
            qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,
            mappings = {
                i = {
                    -- map actions.which_key to <C-h> (default: <C-/>)
                    -- actions.which_key shows the mappings for your picker,
                    -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                    ["<C-h>"] = "which_key",
                    -- Move up and down
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                    ["<Down>"] = "move_selection_next",
                    ["<Up>"] = "move_selection_previous",
                    -- The historical record
                    ["<C-n>"] = "cycle_history_next",
                    ["<C-p>"] = "cycle_history_prev",
                    -- Close the window
                    ["<C-c>"] = "close",
                    -- The preview window scrolls up and down
                    ["<C-u>"] = "preview_scrolling_up",
                    ["<C-d>"] = "preview_scrolling_down",
                }
            }
        },
        pickers = {
            -- Default configuration for builtin pickers goes here:
            -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
        },
        extensions = {
            -- Your extension configuration goes here:
            -- extension_name = {
            --   extension_config_key = value,
            -- }
            -- please take a look at the readme of the extension you want to configure
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true
            }
        }
    }
    require('telescope').load_extension('fzy_native')
    require('telescope').load_extension('env')
    require('telescope').load_extension('projects')
end

function config.project()
    require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        detection_methods = { "pattern" },
        patterns = {
            "README.md",
            "Cargo.toml",
            "package.json",
            ".sln",
            ".git",
            "_darcs",
            ".hg",
            ".bzr",
            ".svn",
            "Makefile",
        },
    }
end

return config
