local config = {}

-- config server in this function
function config.nvim_lsp()
	require("modules.completion.lsp")
end

function config.nvim_cmp()
	local cmp = require("cmp")
	local lspkind = require('lspkind')
	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end
	cmp.setup({
		-- Specify the snippet engine
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				-- vim.fn["vsnip#anonymous"](args.body)     -- For `vsnip` users.
				require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				-- vim.fn["UltiSnips#Anon"](args.body)      -- For `ultisnips` users.
				-- require'snippy'.expand_snippet(args.body)-- For `snippy` users.
			end,
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			-- { name = "vsnip" }, -- For vsnip users.
			{ name = 'luasnip' }, -- For luasnip users.
			-- { name = 'ultisnips' },--For ultisnips users.
			-- { name = 'snippy' },-- For snippy users.
		}, { { name = "buffer" }, { name = "path" } }),
		mapping = cmp.mapping.preset.insert({
			-- Occurrence of complements
			["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			-- Cancel
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
		-- https://github.com/onsails/lspkind.nvim
		formatting = {
			format = lspkind.cmp_format({
				mode = 'symbol', -- show only symbol annotations
				maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

				-- The function below will be called before any actual modifications from lspkind
				-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
				before = function(entry, vim_item)
					vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
					return vim_item
				end
			})
		}
	})

	-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end

function config.lua_snip()
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

function config.lspkind()
	require('lspkind').init({
		-- DEPRECATED (use mode instead): enables text annotations
		--
		-- default: true
		-- with_text = true,

		-- defines how annotations are shown
		-- default: symbol
		-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
		mode = 'symbol_text',

		-- default symbol map
		-- can be either 'default' (requires nerd-fonts font) or
		-- 'codicons' for codicon preset (requires vscode-codicons font)
		--
		-- default: 'default'
		preset = 'codicons',

		-- override preset symbols
		--
		-- default: {}
		symbol_map = {
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
		},
	})
end

return config
