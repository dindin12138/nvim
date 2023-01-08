local config = {}

function config.nvim_lsp()
    require("plugins.lsp")
end

function config.nvim_cmp()
    local cmp = require("cmp")
    local kind_icons = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
    }
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'nvim_lua' },
            { name = 'spell' },
            { name = 'buffer' }
        }, {
            { name = 'path' },
        }),
        mapping = cmp.mapping.preset.insert({
            ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<A-,>"] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close()
            }),
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<CR>"] = cmp.mapping.confirm({
                select = true,
                behavior = cmp.ConfirmBehavior.Replace
            }),
            ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
            ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif require('luasnip').expand_or_jumpable() then
                    require('luasnip').expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif require('luasnip').jumpable(-1) then
                    require('luasnip').jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        }),
        formatting = {
            format = function(_, vim_item)
                vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
                return vim_item
            end,
        }
    })

    cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" },
        },
    })

    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
    })
end

function config.luasnip()
    local ls = require('luasnip')
    ls.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
    })
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({
        paths = { './snippets/' }
    })
end

function config.lsp_signature()
    require('lsp_signature').setup()
end

function config.symbols_outline()
    require("symbols-outline").setup()
end

function config.trouble()
    require("trouble").setup()
end

return config
