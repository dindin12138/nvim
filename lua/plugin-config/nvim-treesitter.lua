local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  vim.notify("没有找到 nvim-treesitter")
  return
end

treesitter.setup({
  ensure_installed = { "bash", "c", "cpp", "lua", "go","java", "gomod", "json", "yaml", "toml", "latex", "make", "python", "rust", "html", "javascript", "typescript", "vue", "css", },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
