local config = {}

function config.nvim_tree()
    require("nvim-tree").setup({
        disable_netrw = true,
        hijack_netrw = true,
        open_on_setup = false,
        ignore_ft_on_setup = { "dashboard" },
        open_on_tab = false,
        hijack_cursor = true,
        diagnostics = {
            enable = false,
            icons = { hint = "", info = "", warning = "", error = "" },
        },
        -- project plugin
        respect_buf_cwd = true,
        update_cwd = true,
        update_focused_file = {
            enable = true,
            update_cwd = true,
        },
        system_open = { cmd = nil, args = {} },
        git = { enable = true, ignore = true, timeout = 500 },
        filters = { dotfiles = false, custom = {} },
        view = {
            width = 30,
            side = 'left',
            hide_root_folder = false,
            number = false,
            relativenumber = false,
            signcolumn = 'yes',
            mappings = {
                custom_only = false,
                list = {
                    -- Open a file or folder
                    { key = { "l", "o", "<CR>" }, action = "edit" },
                    -- Open the file in split screen
                    { key = "v", action = "vsplit" },
                    { key = "h", action = "split" },
                    -- Show hidden files
                    { key = "i", action = "toggle_git_ignored" },
                    { key = ".", action = "toggle_dotfiles" },
                    -- File operations
                    { key = "<F5>", action = "refresh" },
                    { key = "a", action = "create" },
                    { key = "d", action = "remove" },
                    { key = "r", action = "rename" },
                    { key = "x", action = "cut" },
                    { key = "y", action = "copy" },
                    { key = "p", action = "paste" },
                },
            },
        },
        trash = {
            cmd = "trash",
            require_confirm = true,
        },
        actions = {
            open_file = {
                resize_window = true,
                quit_on_open = false,
            },
        },
    })
end

function config.telescope()
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
        pickers = {},
        extensions = {}
    }
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
            ".sln",
            ".git",
            "_darcs",
            ".hg",
            ".bzr",
            ".svn",
            "Makefile",
        },
        exclude_dirs = { "~/.local/*" }
    }
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
    local mappings = require("keymap.whichkey")
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

function config.toggleterm()
    local toggleterm = require("toggleterm")
    local Terminal = require("toggleterm.terminal").Terminal
    toggleterm.setup({
        open_mapping = [[<c-\>]],
        start_in_insert = true,
        direction = 'horizontal'
    })

    local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
            border = "single",
        },
        on_open = function(term)
            vim.cmd("startinsert!")
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
            if vim.fn.mapcheck("<Esc>", "t") ~= "" then
                vim.api.nvim_del_keymap("t", "<Esc>")
            end
        end,
        on_close = function(_)
            vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {
                noremap = true,
                silent = true,
            })
        end,
    })
    local floaterm = Terminal:new({
        direction = 'float',
    })

    function floaterm_toggle()
        floaterm:toggle()
    end

    function lazygit_toggle()
        lazygit:toggle()
    end
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
