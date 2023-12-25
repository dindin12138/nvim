return {
  "rcarriga/nvim-notify",
  lazy = true,
  init = function()
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.notify = function(...)
      require("lazy").load({ plugins = { "nvim-notify" } })
      return vim.notify(...)
    end
  end,
  opts = { stages = "static" },
  config = function(_, opts)
    vim.cmd([[
      highlight NotifyINFOBorder guifg=#89B4FA
      highlight NotifyINFOIcon guifg=#89B4FA
      highlight NotifyINFOTitle guifg=#89B4FA
    ]])
    require("notify").setup(opts)
    vim.notify = require("notify")
  end,
}
