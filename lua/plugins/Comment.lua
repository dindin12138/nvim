return {
  "numToStr/Comment.nvim",
    -- stylua: ignore start
    keys = {
      { mode = { "n" }, "<C-/>",     function() require("Comment.api").toggle.linewise.current() end, desc = "Toggle comment" },
      { mode = { "n" }, "<leader>/", function() require("Comment.api").toggle.linewise.current() end, desc = "Toggle comment" },
    },
    config = true,
}
