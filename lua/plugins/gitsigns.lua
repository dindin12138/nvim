return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    trouble = false,
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 100,
    },
  },
}
