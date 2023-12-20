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
    "ruff-lsp",
    "bash-language-server",
    "gopls",
    "neocmakelsp",
    "sqlls",
    -- Formatter
    "stylua",
    "clang-format",
    "rustfmt",
    "gofumpt",
    -- "black",
    "shfmt",
    "jq",
    "prettierd",
    "sql-formatter",
    "beautysh",
  },
}
