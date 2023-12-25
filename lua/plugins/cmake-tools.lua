return {
  "Civitasv/cmake-tools.nvim",
  ft = { "c", "cpp" },
  dependencies = {
    "stevearc/overseer.nvim",
    { "akinsho/toggleterm.nvim", version = "*", config = true },
  },
  opts = { cmake_build_directory = "build/${variant:buildType}" },
  config = function(_, opts)
    require("cmake-tools").setup(opts)
  end,
}
