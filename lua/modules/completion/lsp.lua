local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
    local map = vim.keymap.set
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    map("n", "gr", "<cmd>Lspsaga rename<CR>", bufopts)
    map("n", "ga", "<cmd>Lspsaga code_action<CR>", bufopts)
    map("n", "gp", "<cmd>Lspsaga preview_definition<CR>", bufopts)
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
    map("n", "gh", "<cmd>Lspsaga hover_doc<CR>", bufopts)
    map("n", "gl", "<cmd>Lspsaga lsp_finder<CR>", bufopts)
    map("n", "gs", "<cmd>Lspsaga signature_help<CR>", bufopts)
    map("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
    map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
    map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
    map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", bufopts)
    map("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

lsp_installer.setup({
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer", "sumneko_lua" }
    -- This setting has no relation with the `automatic_installation` setting.
    ensure_installed = { 'sumneko_lua', 'clangd', 'rust_analyzer', 'pyright', 'bashls', 'jsonls' },

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    automatic_installation = false,
    ui = {
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "rounded",
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

lspconfig['sumneko_lua'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            }
        },
    },
}

lspconfig['clangd'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    args = {
        "--background-index",
        "-std=c++20",
        "--clang-tidy",
        "--clang-tidy-checks=bugprone-*, clang-analyzer-*, google-*, modernize-*, performance-*, portability-*, readability-*, -bugprone-too-small-loop-variable, -clang-analyzer-cplusplus.NewDelete, -clang-analyzer-cplusplus.NewDeleteLeaks, -modernize-use-nodiscard, -modernize-avoid-c-arrays, -readability-magic-numbers, -bugprone-branch-clone, -bugprone-signed-char-misuse, -bugprone-unhandled-self-assignment, -clang-diagnostic-implicit-int-float-conversion, -modernize-use-auto, -modernize-use-trailing-return-type, -readability-convert-member-functions-to-static, -readability-make-member-function-const, -readability-qualified-auto, -readability-redundant-access-specifiers,",
        "--completion-style=detailed",
        "--cross-file-rename=true",
        "--header-insertion=iwyu",
        "--pch-storage=memory",
        "--function-arg-placeholders=false",
        "--log=verbose",
        "--ranking-model=decision_forest",
        "--header-insertion-decorators",
        "--fallback-style=Google",
        "--all-scopes-completion",
        "-j=12",
        "--pretty",
    },
}

lspconfig['pyright'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    },
}

lspconfig['jsonls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

lspconfig['rust_analyzer'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

local diagnostic_icon = function()
    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        -- update_in_insert = true,
    })
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

diagnostic_icon()
