local lsp_installer = require("nvim-lsp-installer")

local servers = {
	sumneko_lua = require("lsp.config.sumneko_lua"), -- lua/lsp/config/lua.lua
	clangd = require("lsp.config.clangd"),
	pyright = require("lsp.config.pyright"),
	rust_analyzer = require("lsp.config.rust_analyzer"),
}
-- 自动安装 Language Servers
for name, _ in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end

lsp_installer.on_server_ready(function(server)
	local config = servers[server.name]
	if config == nil then
		return
	end
	if config.on_setup then
		config.on_setup(server)
	else
		server:setup({})
	end
end)

local diagnostic_icon = function()
	vim.diagnostic.config({
		virtual_text = true,
		signs = true,
		-- update_in_insert = true,
	})
	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

diagnostic_icon()