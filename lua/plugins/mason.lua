return {
  "williamboman/mason.nvim",
  enabled = os.execute("grep -q '^ID=.*nixos' /etc/os-release") == 1,
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
  build = ":MasonUpdate",
  opts = {
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
      "gofumpt",
      "shfmt",
      "jq",
      "prettier",
      "sql-formatter",
      "beautysh",
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
    local mr = require("mason-registry")
    local function ensure_installed()
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end
    if mr.refresh then
      mr.refresh(ensure_installed)
    else
      ensure_installed()
    end
  end,
}
