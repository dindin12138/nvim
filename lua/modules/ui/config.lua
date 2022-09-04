local config = {}

function config.lualine()
    local lualine = require('lualine')
    local config = {
        options = {
            theme = "auto",
            component_separators = { left = "", right = "" },
            -- https://github.com/ryanoasis/powerline-extra-symbols
            section_separators = { left = " ", right = "" },
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { { 'filetype', icon_only = true }, 'filename' },
            lualine_c = {
                { 'branch', icon = ' ' },
                { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } }
            },
            lualine_x = { { 'diagnostics', symbols = { error = ' ', warn = ' ', info = ' ', hint = 'ﯧ ' } } },
            lualine_y = { 'fileformat', 'encoding' },
            lualine_z = { 'progress' }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = { 'filename' },
            lualine_c = {},
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = { "nvim-tree", "toggleterm", "aerial" },
    }

    -- Inserts a component in lualine_x ot right section
    table.insert(config.sections.lualine_x, {
        -- Lsp server name .
        function()
            local msg = 'No Active Lsp'
            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
                return msg
            end
            for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                end
            end
            return msg
        end,
        icon = '  LSP ~'
    })

    lualine.setup(config)
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
        -- {
        --     icon = '  ',
        --     desc = 'Sessions                                ',
        --     action = 'Telescope session-lens search_session',
        --     shortcut = 'SPC f p'
        -- },
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
