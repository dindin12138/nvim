return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
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
