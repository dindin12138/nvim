-- leader key 为 Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 本地变量
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

-- 不映射 s 键
map("n", "s", "<nop>", opt)

-- windows 分屏快捷键
map("n", "sl", ":vsp<CR>", opt)
map("n", "sj", ":sp<CR>", opt)
map("n", "sv", "<C-w>t<C-w>H", opt)
map("n", "sh", "<C-w>t<C-w>K", opt)
map("n", "sc", "<C-w>c", opt)
map("n", "so", "<C-w>o", opt)
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
-- 上下比例
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 上下左右滚动浏览
map("n", "J", "5j", opt)
map("n", "K", "5k", opt)
map("n", "H", "5h", opt)
map("n", "L", "5l", opt)
-- ctrl u / ctrl + d  只移动10行，默认移动半屏
map("n", "<C-u>", "10k", opt)
map("n", "<C-d>", "10j", opt)

-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)

-- 保存 退出
map("n", "<C-s>", ":w<CR>", opt)
map("n", "W", ":w<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

--------------------------------------------------------------------
-- 插件快捷键
local pluginKeys = {}

-- packer.nvim
map("n", "<leader>ps", ":PackerSync<CR>", opt)
map("n", "<leader>pu", ":PackerUpdate<CR>", opt)
map("n", "<leader>pi", ":PackerInstall<CR>", opt)
map("n", "<leader>pc", ":PackerCompile<CR>", opt)

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
pluginKeys.nvimTreeList = {
	{ key = { "l", "o", "<CR>" }, action = "edit" },
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	{ key = "i", action = "toggle_git_ignored" },
	{ key = ".", action = "toggle_dotfiles" },
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "y", action = "copy" },
	{ key = "p", action = "paste" },
}

-- bufferline
map("n", "<C-n>", ":BufferLineCycleNext<CR>", opt)
map("n", "<leader>q", ":Bdelete!<CR>", opt)
map("n", "<leader>x", ":BufferLinePickClose<CR>", opt)
-- Leader + Number切换
map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opt)
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opt)
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opt)
map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opt)
map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opt)
map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opt)
map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opt)
map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opt)
map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opt)

-- session
map("n", "<Leader>ss", ":SaveSession<CR>", opt)
map("n", "<Leader>sr", ":RestoreSession<CR>", opt)
map("n", "<Leader>sd", ":DeleteSession<CR>", opt)

-- Telescope
map("n", "<Leader>ff", ":Telescope find_files<CR>", opt)
map("n", "<Leader>fo", ":Telescope oldfiles<CR>", opt)
map("n", "<Leader>fa", ":Telescope live_grep<CR>", opt)
map("n", "<Leader>fp", ":Telescope projects<CR>", opt)
map("n", "<Leader>fe", ":Telescope env<CR>", opt)
map("n", "<Leader>fs", ":Telescope session-lens search_session<CR>", opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
	i = {
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		["<Down>"] = "move_selection_next",
		["<Up>"] = "move_selection_previous",
		["<C-n>"] = "cycle_history_next",
		["<C-p>"] = "cycle_history_prev",
		["<C-c>"] = "close",
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
	mapbuf("n", "gr", "<cmd>Lspsaga rename<CR>", opt)
	mapbuf("n", "ga", "<cmd>Lspsaga code_action<CR>", opt)
	mapbuf("n", "gp", "<cmd>Lspsaga preview_definition<CR>", opt)
	mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
	mapbuf("n", "gl", "<cmd>Lspsaga lsp_finder<CR>", opt)
	mapbuf("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
	mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
	mapbuf("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opt)
	mapbuf("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opt)
end

-- LSP
map("n", "<leader>li", ":LspInfo<CR>", opt)
map("n", "<leader>lr", ":LspRestart<CR>", opt)
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
	return {
		["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<A-,>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
	}
end

-- 自定义 toggleterm 3个不同类型的命令行窗口
pluginKeys.mapToggleTerm = function(toggleterm)
	vim.keymap.set({ "n", "t" }, "<leader>tf", toggleterm.toggle_float)
	vim.keymap.set({ "n", "t" }, "<leader>tv", toggleterm.toggle_vertical)
	vim.keymap.set({ "n", "t" }, "<leader>th", toggleterm.toggle_horizontal)
	vim.keymap.set({ "n", "t" }, "<leader>tg", toggleterm.toggle_lazygit)
end

-- startuptime
map("n", "<leader>st", ":StartupTime<CR>", opt)

return pluginKeys
