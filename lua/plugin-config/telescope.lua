require("telescope").setup({
	defaults = {
		initial_mode = "insert",
		layout_config = {
			horizontal = { prompt_position = "top", results_width = 0.6 },
			vertical = { mirror = false }
		},
		sorting_strategy = 'ascending',
		file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
		grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
		qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,
		mappings = require("keybindings").telescopeList,
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	},
})
require('telescope').load_extension('env')
require('telescope').load_extension('projects')
require("telescope").load_extension("session-lens")
