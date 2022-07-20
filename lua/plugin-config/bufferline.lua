require('bufferline').setup {
	options = {
		always_show_bufferline = true,
		mode = "buffers",
		numbers = "ordinal",
		-- Command to close Buffer famiu/bufdelete.nvim :Bdelete
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator_icon = '▎',
		buffer_close_icon = '',
		modified_icon = '✥',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "center",
				padding = 1,
			},
		},
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or "")
				s = s .. n .. sym
			end
			return s
		end,
	}
}
