return {
  "folke/todo-comments.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    keywords = {
      FIX = { icon = " ", color = "#C84749", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
      TODO = { icon = " ", color = "#0FAAC7" },
      HACK = { icon = " ", color = "#E0AF68" },
      WARN = { icon = " ", color = "#E0AF68", alt = { "WARNING", "XXX" } },
      PERF = { icon = "󱑎 ", color = "#BB9AF7", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = "󰍨 ", color = "#12AA7A", alt = { "INFO" } },
      TEST = { icon = " ", color = "#0FAAC7", alt = { "TESTING", "PASSED", "FAILED" } },
    },
  },
}
