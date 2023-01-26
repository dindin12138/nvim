local config = {}

function config.catppuccin()
    require("catppuccin").setup()
    vim.api.nvim_command "colorscheme catppuccin"
end

function config.lualine()
    local lualine = require('lualine')
    local config = {
        options = {
            component_separators = { left = "", right = "" },
            section_separators = { left = " ", right = "" },
        },
        sections = {
            lualine_a = { { 'mode', icon = '' } },
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
        extensions = { "nvim-tree", "toggleterm", "aerial", "symbols-outline" },
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
    require('dashboard').setup({
        theme = 'doom',
        config = {
            header = {
                [[]],
                [[]],
                [[]],
                [[]],
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
            },
            center = {
                { icon = '  ', icon_hi = 'Title', desc = 'Projects                                ',
                    desc_hi = 'String', key = 'p', key_hi = 'Number', action = 'Telescope projects' },
                { icon = '  ', icon_hi = 'Title', desc = 'Recently Files                          ',
                    desc_hi = 'String', key = 'o', key_hi = 'Number', action = 'Telescope oldfiles' },
                { icon = '  ', icon_hi = 'Title', desc = 'Find Files                              ',
                    desc_hi = 'String', key = 'f', key_hi = 'Number', action = 'Telescope find_files' },
                { icon = '  ', icon_hi = 'Title', desc = 'Update Plugins                          ',
                    desc_hi = 'String', key = 's', key_hi = 'Number', action = 'Lazy sync', },
                { icon = '  ', icon_hi = 'Title', desc = 'Edit Dotfiles                           ',
                    desc_hi = 'String', key = 'c', key_hi = 'Number', action = 'edit ~/.config/nvim/lua/core/keymap.lua' },
            },
            footer = {
                [[]],
                [[Talk is cheap. Show me the code.]],
            }
        }
    })
end

function config.bufferline()
    require('bufferline').setup {
        options = {
            numbers = "ordinal",
            close_command = "Bdelete! %d",
            right_mouse_command = "Bdelete! %d",
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

function config.notify()
    require("notify").setup({
        stages = "static"
    })

    vim.notify = require("notify")

    -- Utility functions shared between progress reports for LSP and DAP

    local client_notifs = {}

    local function get_notif_data(client_id, token)
        if not client_notifs[client_id] then
            client_notifs[client_id] = {}
        end

        if not client_notifs[client_id][token] then
            client_notifs[client_id][token] = {}
        end

        return client_notifs[client_id][token]
    end

    local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

    local function update_spinner(client_id, token)
        local notif_data = get_notif_data(client_id, token)

        if notif_data.spinner then
            local new_spinner = (notif_data.spinner + 1) % #spinner_frames
            notif_data.spinner = new_spinner

            notif_data.notification = vim.notify(nil, nil, {
                hide_from_history = true,
                icon = spinner_frames[new_spinner],
                replace = notif_data.notification,
            })

            vim.defer_fn(function()
                update_spinner(client_id, token)
            end, 100)
        end
    end

    local function format_title(title, client_name)
        return client_name .. (#title > 0 and ": " .. title or "")
    end

    local function format_message(message, percentage)
        return (percentage and percentage .. "%\t" or "") .. (message or "")
    end

    -- LSP integration
    -- Make sure to also have the snippet with the common helper functions in your config!

    vim.lsp.handlers["$/progress"] = function(_, result, ctx)
        local client_id = ctx.client_id

        local val = result.value

        if not val.kind then
            return
        end

        local notif_data = get_notif_data(client_id, result.token)

        if val.kind == "begin" then
            local message = format_message(val.message, val.percentage)

            notif_data.notification = vim.notify(message, "info", {
                title = format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
                icon = spinner_frames[1],
                timeout = false,
                hide_from_history = false,
            })

            notif_data.spinner = 1
            update_spinner(client_id, result.token)
        elseif val.kind == "report" and notif_data then
            notif_data.notification = vim.notify(format_message(val.message, val.percentage), "info", {
                replace = notif_data.notification,
                hide_from_history = false,
            })
        elseif val.kind == "end" and notif_data then
            notif_data.notification =
            vim.notify(val.message and format_message(val.message) or "Complete", "info", {
                icon = "",
                replace = notif_data.notification,
                timeout = 3000,
            })

            notif_data.spinner = nil
        end
    end

    -- table from lsp severity to vim severity.
    local severity = {
        "error",
        "warn",
        "info",
        "info", -- map both hint and info to info?
    }
    vim.lsp.handlers["window/showMessage"] = function(err, method, params, client_id)
        vim.notify(method.message, severity[params.type])
    end
end

function config.navic()
    vim.api.nvim_set_hl(0, "NavicIconsFile", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsModule", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsNamespace", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsPackage", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsClass", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsProperty", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsField", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsConstructor", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsEnum", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsInterface", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsFunction", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsVariable", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsConstant", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsString", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsNumber", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsBoolean", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsArray", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsObject", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsKey", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsNull", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsStruct", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsEvent", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = true, bg = "#181825", fg = "#42A5F5" })
    vim.api.nvim_set_hl(0, "NavicText", { default = true, bg = "#181825", fg = "#9FA1BA" })
    vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "#181825", fg = "#9FA1BA" })
    require("nvim-navic").setup({
        icons = {
            File = ' ',
            Module = ' ',
            Namespace = ' ',
            Package = ' ',
            Class = ' ',
            Method = ' ',
            Property = ' ',
            Field = ' ',
            Constructor = ' ',
            Enum = ' ',
            Interface = ' ',
            Function = ' ',
            Variable = ' ',
            Constant = ' ',
            String = ' ',
            Number = ' ',
            Boolean = ' ',
            Array = ' ',
            Object = ' ',
            Key = ' ',
            Null = ' ',
            EnumMember = ' ',
            Struct = ' ',
            Event = ' ',
            Operator = ' ',
            TypeParameter = ' '
        },
        highlight = true
    })
    vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
end

return config
