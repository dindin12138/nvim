return {
  "aserowy/tmux.nvim",
  cond = os.getenv("TMUX") ~= nil,
  event = { "BufReadPost", "BufNewFile" },
  config = true,
}
