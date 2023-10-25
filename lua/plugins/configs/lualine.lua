return {
  options = {
    component_separators = { left = "", right = "" },
    section_separators = { left = " ", right = "" },
  },
  sections = {
    lualine_a = { { "mode", icon = "" } },
    lualine_b = { { "filetype", icon_only = true }, "filename" },
    lualine_c = {
      { "branch", icon = " " },
      { "diff", symbols = { added = " ", modified = " ", removed = " " } },
    },
    lualine_x = {
      { "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = "ﯧ " } },
      {
        function()
          local msg = "No Active Lsp"
          local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
          local clients = vim.lsp.get_active_clients()
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
        icon = "  LSP ~",
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
