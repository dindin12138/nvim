return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  opts = function()
    local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]
    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      config = {
        header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            { action = "Telescope projects", desc = "Projects", icon = "  ", key = "p" },
            { action = "Telescope oldfiles", desc = "Recent files", icon = "  ", key = "o" },
            { action = "Telescope find_files", desc = "Find Files", icon = "󰥨  ", key = "f" },
            { action = "Lazy", desc = "Lazy", icon = "󰒲  ", key = "l" },
            { action = "edit ~/.config/nvim/lua/core/lazy.lua", desc = "Config", icon = "  ", key = "c" },
            { action = "qa", desc = "Quit", icon = "  ", key = "q" },
          },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local foot = "\n"
            .. "Talk is cheap. Show me the code."
            .. "\n\n"
            .. "⚡ Neovim loaded "
            .. stats.loaded
            .. "/"
            .. stats.count
            .. " plugins in "
            .. ms
            .. "ms"
          return vim.split(foot, "\n")
        end,
      },
    }
    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 40 - #button.desc)
      button.icon_hl = "Title"
      button.desc_hl = "String"
      button.key_hl = "Number"
    end
    return opts
  end,
}
