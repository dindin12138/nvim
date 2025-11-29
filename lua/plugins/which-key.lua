return {
  "folke/which-key.nvim",
  keys = "<leader>",
  opts = {
    win = {
      border = "rounded",
    },
    icons = {
      colors = false,
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    -- wk.register(opts.defaults)
  end,
}
