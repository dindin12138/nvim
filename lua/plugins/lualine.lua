return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = function()
    local icons = require("core.icons")
    return {
      options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = icons.misc.SeparatorLeft, right = icons.misc.SeparatorRight },
      },
      sections = {
        lualine_a = { { "mode", icon = icons.misc.Vim } },
        lualine_b = { { "filetype", icon_only = true }, "filename" },
        lualine_c = {
          { "branch", icon = icons.git.Branch },
          {
            "diff",
            symbols = {
              added = icons.git.Add,
              modified = icons.git.Change,
              removed = icons.git.Delete,
            },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          {
            function()
              local msg = "No Active Lsp"
              local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
              local clients = vim.lsp.get_clients()
              if next(clients) == nil then
                return msg
              end
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return client.name
                end
              end
              return msg
            end,
            icon = icons.misc.ActiveLSP .. " LSP ~",
          },
        },
        lualine_y = { "fileformat", "encoding" },
        lualine_z = { "progress" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = { "filename" },
        lualine_c = {},
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "neo-tree", "nvim-tree", "toggleterm", "aerial", "symbols-outline" },
    }
  end,
}
