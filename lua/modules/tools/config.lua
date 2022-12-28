local config = {}

function config.nvim_tree()
    require("nvim-tree").setup({
        disable_netrw = true,
        ignore_ft_on_setup = { "dashboard" },
        hijack_cursor = true,
        respect_buf_cwd = true,
        update_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = false,
        },
        git = { enable = false, ignore = false },
        filters = { dotfiles = true },
        view = {
            width = 25,
            hide_root_folder = true,
            mappings = {
                custom_only = false,
                list = {
                    { key = { "l", "o", "<CR>" }, action = "edit" },
                    { key = "v", action = "vsplit" },
                    { key = "h", action = "split" },
                    { key = "i", action = "toggle_git_ignored" },
                    { key = ".", action = "toggle_dotfiles" },
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
    })
end

function config.telescope()
    require('telescope').setup {
        defaults = {
            layout_config = {
                horizontal = { prompt_position = "top", results_width = 0.6 },
                vertical = { mirror = false }
            },
            sorting_strategy = 'ascending',
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
                }
            }
        }
    }
    require('telescope').load_extension('projects')
end

function config.project()
    require("project_nvim").setup {
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
    require('gitsigns').setup({
        trouble                 = false,
        current_line_blame      = true,
        current_line_blame_opts = {
            delay = 100
        }
    })
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

return config
