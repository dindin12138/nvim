local config = {}

function config.nvim_treesitter()
    require 'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
        -- ensure_installed = { "c", "lua", "rust" },
        ensure_installed = "all",
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- List of parsers to ignore installing (for "all")
        ignore_install = { 'phpdoc' },
        highlight = {
            -- `false` will disable the whole extension
            enable = true,
            -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
            -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
            -- the name of the parser)
            -- list of language that will be disabled
            -- disable = { "c", "rust" },

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        }
    }
end

function config.autopairs()
    require("nvim-autopairs").setup {
        check_ts = true,
        ts_config = {
            lua = { 'string' }, -- it will not add a pair on that treesitter node
            javascript = { 'template_string' },
            java = false, -- don't check treesitter on java
        }
    }
    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
    )
end

function config.comment()
    require('Comment').setup({
        ---LHS of toggle mappings in NORMAL + VISUAL mode
        ---@type table
        toggler = {
            ---Line-comment toggle keymap
            line = 'gcc',
            ---Block-comment toggle keymap
            block = 'gbc',
        },
        ---LHS of operator-pending mappings in NORMAL + VISUAL mode
        ---@type table
        opleader = {
            ---Line-comment keymap
            line = 'gc',
            ---Block-comment keymap
            block = 'gb',
        },
    })
end

return config
