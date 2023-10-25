return {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
  ensure_installed = {
    -- LSP
    "lua-language-server",
    "clangd",
    "rust-analyzer",
    "pyright",
    "bash-language-server",
    "gopls",
    "cmake-language-server",
    -- Formatter
    "stylua",
    "clang-format",
    "rustfmt",
    "gofumpt",
    "black",
    "shfmt",
    "jq"
  },
}
