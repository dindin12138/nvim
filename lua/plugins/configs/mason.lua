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
        'lua-language-server',
        'clangd',
        'rust-analyzer',
        'pyright',
        'bash-language-server',
        'gopls',
        'cmake-language-server',
    }
}
