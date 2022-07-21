local config = {}

function config.catppuccin()
    vim.cmd('colorscheme catppuccin')
end

function config.lualine()
    require("lualine").setup({
        options = {
            theme = "auto",
            component_separators = { left = "|", right = "|" },
            -- https://github.com/ryanoasis/powerline-extra-symbols
            section_separators = { left = " ", right = "" },
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { 'filename' },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = { "nvim-tree", "toggleterm" },
    })
end

function config.dashboard()
    local home = os.getenv('HOME')
    local db = require('dashboard')
    db.session_directory = home .. '/.cache/nvim/sessions'
    db.custom_header = {
        [[]],
        [[]],
        [[]],
        [[]],
        [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
        [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
        [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
        [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
        [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
        [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        [[]],
        [[]],
        [[]],
        [[]],
    }
    db.custom_center = {
        {
            icon = '  ',
            desc = 'Sessions                                ',
            action = 'Telescope session-lens search_session',
            shortcut = 'SPC f p'
        },
        {
            icon = '  ',
            desc = 'Projects                                ',
            action = 'Telescope projects',
            shortcut = 'SPC f p'
        },
        {
            icon = '  ',
            desc = 'Recently Files                          ',
            action = 'Telescope oldfiles',
            shortcut = 'SPC f o'
        },
        {
            icon = '  ',
            desc = 'Find Files                              ',
            action = 'Telescope find_files find_command=rg,--hidden,--files',
            shortcut = 'SPC f f'
        },
        {
            icon = '  ',
            desc = 'Update Plugins                          ',
            action = 'PackerSync',
            shortcut = 'SPC p s'
        },
        {
            icon = '  ',
            desc = 'Edit Keybindings                        ',
            action = 'edit ~/.config/nvim/lua/keymap/init.lua',
            shortcut = 'SPC x x'
        },
        {
            icon = '  ',
            desc = 'Edit Projects                           ',
            action = 'edit ~/.local/share/nvim/project_nvim/project_history',
            shortcut = 'SPC x x'
        },
    }
    db.custom_footer = { 'Talk is cheap. Show me the code.' }
end

function config.bufferline()
    require('bufferline').setup {
        options = {
            always_show_bufferline = true,
            mode = "buffers",
            numbers = "ordinal",
            -- Command to close Buffer moll/vim-bbye :Bdelete
            close_command = "Bdelete! %d",
            right_mouse_command = "Bdelete! %d",
            left_mouse_command = "buffer %d",
            middle_mouse_command = nil,
            indicator_icon = '▎',
            buffer_close_icon = '',
            modified_icon = '✥',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "center",
                    padding = 1,
                },
            },
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local s = " "
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and " " or (e == "warning" and " " or "")
                    s = s .. n .. sym
                end
                return s
            end,
        }
    }
end

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
            height = 30,
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

function config.indent_blankline()
    require("indent_blankline").setup({
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
        context_patterns = {
            "class",
            "function",
            "method",
            "element",
            "^if",
            "^while",
            "^for",
            "^object",
            "^table",
            "block",
            "arguments",
        },
        -- :echo &filetype
        filetype_exclude = {
            "dashboard",
            "packer",
            "terminal",
            "help",
            "log",
            "markdown",
            "TelescopePrompt",
            "lsp-installer",
            "lspinfo",
            "toggleterm",
            "json",
            "txt",
        },
        char = "▏",
    })
end

function config.notify()
    require("notify").setup({
        ---@usage Animation style one of { "fade", "slide", "fade_in_slide_out", "static" }
        stages = "slide",
        ---@usage Function called when a new window is opened, use for changing win settings/config
        on_open = nil,
        ---@usage Function called when a window is closed
        on_close = nil,
        ---@usage timeout for notifications in ms, default 5000
        timeout = 2000,
        -- Render function for notifications. See notify-render()
        render = "default",
        ---@usage highlight behind the window for stages that change opacity
        background_colour = "Normal",
        ---@usage minimum width for notification windows
        minimum_width = 50,
        ---@usage Icons for the different levels
        icons = {
            ERROR = "",
            WARN = "",
            INFO = "",
            DEBUG = "",
            TRACE = "✎",
        },
    })

    vim.notify = require("notify")
end

return config
