local status, db = pcall(require, "dashboard")
if not status then
	vim.notify("没有找到 dashboard")
	return
end

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
	{
		icon = '  ',
		desc = 'Projects                                ',
		action = 'Telescope projects',
		shortcut = 'SPC f p'
	},
	{
		icon = '  ',
		desc = 'Recently File                           ',
		action = 'Telescope oldfiles',
		shortcut = 'SPC f o'
	},
	{
		icon = '  ',
		desc = 'Find File                               ',
		action = 'Telescope find_files',
		shortcut = 'SPC f f'
	},
	{
		icon = '  ',
		desc = 'Update Plugins                          ',
		action = 'PackerUpdate',
		shortcut = 'SPC p u'
	},
	{
		icon = '  ',
		desc = 'Edit keybindings                        ',
		action = 'edit ~/.config/nvim/lua/keybindings.lua',
		shortcut = 'SPC x x'
	},
	{
		icon = '  ',
		desc = 'Edit Projects                           ',
		action = 'edit ~/.local/share/nvim/project_nvim/project_history',
		shortcut = 'SPC x x'
	},
}
