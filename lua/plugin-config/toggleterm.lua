local status, toggleterm = pcall(require, "toggleterm")
if not status then
	vim.notify("没有找到 toggleterm")
	return
end

toggleterm.setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.3
		end
	end,
	start_in_insert = true,
})

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "double",
	},
	on_open = function(term)
		vim.cmd("startinsert!")
		-- q / <leader>tg 关闭 terminal
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<leader>tg", "<cmd>close<CR>", { noremap = true, silent = true })
		-- ESC 键取消，留给lazygit
		if vim.fn.mapcheck("<Esc>", "t") ~= "" then
			vim.api.nvim_del_keymap("t", "<Esc>")
		end
	end,
	on_close = function(_)
		-- 添加回来
		vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {
			noremap = true,
			silent = true,
		})
	end,
})

local terminal_float = Terminal:new({
	direction = "float",
	close_on_exit = true,
})

local terminal_vertical = Terminal:new({
	direction = "vertical",
	close_on_exit = true,
})

local Terminal_horizontal = Terminal:new({
	direction = "horizontal",
	close_on_exit = true,
})

local M = {}

M.toggle_float = function()
	if terminal_float:is_open() then
		terminal_float:close()
		return
	end
	terminal_vertical:close()
	Terminal_horizontal:close()
	terminal_float:open()
end

M.toggle_vertical = function()
	if terminal_vertical:is_open() then
		terminal_vertical:close()
		return
	end
	terminal_float:close()
	Terminal_horizontal:close()
	terminal_vertical:open()
end

M.toggle_horizontal = function()
	if Terminal_horizontal:is_open() then
		Terminal_horizontal:close()
		return
	end
	terminal_float:close()
	terminal_vertical:close()
	Terminal_horizontal:open()
end

M.toggle_lazygit = function()
	lazygit:toggle()
end

require("keybindings").mapToggleTerm(M)
