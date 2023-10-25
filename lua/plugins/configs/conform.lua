return {
    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        rust = { "rustfmt" },
        go = { "gofumpt" },
        python = { "black" },
        sh = { "shfmt" },
        json = { "jq" }
    }
}
