return {
  attach_mode = "global",
  backends = { "lsp", "treesitter", "markdown", "man" },
  show_guides = true,
  layout = { min_width = 28 },
  guides = {
    mid_item = "├╴",
    last_item = "└╴",
    nested_top = "│ ",
    whitespace = "  ",
  },
}
