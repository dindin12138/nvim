local config = {}

function config.telescope()
    if not packer_plugins['plenary.nvim'].loaded then
        vim.cmd [[packadd plenary.nvim]]
        vim.cmd [[packadd popup.nvim]]
        vim.cmd [[packadd telescope-fzy-native.nvim]]
        vim.cmd [[packadd telescope-env.nvim]]
        vim.cmd [[packadd project.nvim]]
        -- vim.cmd [[packadd auto-session]]
        -- vim.cmd [[packadd session-lens]]
        vim.cmd [[packadd nvim-cmp]]
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
    -- require("telescope").load_extension("session-lens")
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

function config.filetype()
    -- In init.lua or filetype.nvim's config file
    require("filetype").setup({
        overrides = {
            shebang = {
                -- Set the filetype of files with a dash shebang to sh
                dash = "sh",
            },
        },
    })
end

function config.fidget()
    require("fidget").setup({})
end

function config.gitsigns()
    require('gitsigns').setup {
        signs                        = {
            add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
            change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
            delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
            topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
            changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        },
        signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = {
            interval = 1000,
            follow_files = true
        },
        attach_to_untracked          = true,
        current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 100,
            ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil, -- Use default
        max_file_length              = 40000,
        preview_config               = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },
        yadm                         = {
            enable = false
        },
    }
end

function config.which_key()
    local wk = require("which-key")
    local mappings = require("keymap.pluginkey")
    wk.setup {}
    wk.register(mappings)
end

function config.mason()
    require("mason").setup({
        ui = {
            -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
            border = "rounded",
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
end

-- function config.auto_save()
--     require("auto-save").setup(
--         {
--             enabled = true,
--             execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
--             events = { "InsertLeave" },
--             conditions = {
--                 exists = true,
--                 filename_is_not = {},
--                 filetype_is_not = {},
--                 modifiable = true
--             },
--             write_all_buffers = false,
--             on_off_commands = true,
--             clean_command_line_interval = 0,
--             debounce_delay = 135
--         }
--     )
-- end

-- function config.auto_session()
--     require('auto-session').setup({
--         log_level = 'info',
--         auto_session_enable_last_session = false,
--         auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
--         auto_session_enabled = false,
--         auto_session_create_enabled = false,
--         auto_save_enabled = nil,
--         auto_restore_enabled = nil,
--         auto_session_suppress_dirs = nil,
--         auto_session_use_git_branch = nil,
--         -- the configs below are lua only
--         bypass_session_save_file_types = nil
--     })
-- end

return config
