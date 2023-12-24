return {
  "folke/which-key.nvim",
  keys = "<leader>",
  opts = {
    window = {
      border = "rounded",
    },
    defaults = {
      mode = { "n", "v" },
      ["<leader>f"] = { name = "+Telescope" },
      ["<leader>s"] = { name = "+Split" },
      ["<leader>l"] = { name = "+LSP/Lazy" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
