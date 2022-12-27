local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = true }')
    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup('lsp_document_highlight', {
            clear = false
        })
        vim.api.nvim_clear_autocmds({
            buffer = bufnr,
            group = 'lsp_document_highlight',
        })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end
    local map = vim.keymap.set
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    map("n", "gr", "<cmd>Lspsaga rename<CR>", bufopts)
    map("n", "ga", "<cmd>Lspsaga code_action<CR>", bufopts)
    map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", bufopts)
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

local lsp_flags = { debounce_text_changes = 150 }

mason_lspconfig.setup({
    ensure_installed = { 'sumneko_lua', 'clangd', 'rust_analyzer', 'pyright', 'bashls', 'jsonls' },
    automatic_installation = false,
})

lspconfig['sumneko_lua'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
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

lspconfig['jsonls'].setup { on_attach = on_attach, flags = lsp_flags }

lspconfig['rust_analyzer'].setup { on_attach = on_attach, flags = lsp_flags }

local diagnostic_icon = function()
    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        -- update_in_insert = true,
    })
    local signs = { Error = " ", Warn = " ", Hint = "ﯧ ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

diagnostic_icon()
