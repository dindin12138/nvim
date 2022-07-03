local config = {}

-- config server in this function
function config.nvim_lsp()
	require("modules.completion.lsp")
end

function config.nvim_cmp()
	local cmp = require("cmp")

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
		}),
	})

	-- / Find patterns using buffer sources
	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- : Use path and cmdline sources in command line mode
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

return config
