local config = {}

function config.nvim_treesitter()
    require 'nvim-treesitter.configs'.setup {
        ensure_installed = "all",
        ignore_install = { 'phpdoc' },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<CR>",
                node_incremental = "<CR>",
                node_decremental = "<BS>",
                scope_incremental = "<TAB>",
            },
        },
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
            colors = {
                "#d79921",
                "#a4b9ef",
                "#a89984",
                "#b16286",
                "#689d6a",
                "#d65d0e",
                "#458588",
            },
            termcolors = {
                "Yellow",
                "Black",
                "Green",
                "Blue",
                "Magenta",
                "Cyan",
                "White",
            },
        }
    }
end

function config.autopairs()
    require("nvim-autopairs").setup {
        check_ts = true,
        ts_config = {
            lua = { 'string' },
            javascript = { 'template_string' },
            java = false,
        }
    }
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
    )
end

function config.comment()
    require('Comment').setup()
end

function config.todo()
    require("todo-comments").setup {}
end

return config
