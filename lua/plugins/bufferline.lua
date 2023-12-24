return {
  "akinsho/bufferline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    { "famiu/bufdelete.nvim", cmd = "Bdelete" },
    "nvim-tree/nvim-web-devicons",
  },
  opts = function()
    local icons = require("core.icons")
    return {
      options = {
        numbers = "ordinal",
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        offsets = {
          {
            filetype = "neo-tree",
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
            local sym = e == "error" and " " .. icons.diagnostics.Error
              or (e == "warning" and " " .. icons.diagnostics.Warn or " " .. icons.diagnostics.Hint)
            s = s .. n .. sym
          end
          return s
        end,
      },
    }
  end,
}
