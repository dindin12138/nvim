local lspconfig = require("lspconfig")

-- Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local map = vim.keymap.set
        local bufopts = { noremap = true, silent = true, buffer = ev.buf }
        map("n", "ga", "<CMD>lua vim.lsp.buf.code_action()<CR>", bufopts)
        map("n", "gn", "<CMD>lua vim.lsp.buf.rename()<CR>", bufopts)
        map("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", bufopts)
        map("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", bufopts)
        map("n", "gh", "<CMD>lua vim.lsp.buf.hover()<CR>", bufopts)
        map("n", "gs", "<CMD>lua vim.lsp.buf.signature_help()<CR>", bufopts)
        map("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", bufopts)
        map("n", "ge", "<CMD>lua vim.diagnostic.open_float()<CR>", bufopts)
        map("n", "gj", "<CMD>lua vim.diagnostic.goto_next()<CR>", bufopts)
        map("n", "gk", "<CMD>lua vim.diagnostic.goto_prev()<CR>", bufopts)
    end,
})

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = true }')

    -- Highlight symbol under cursor
    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup('lsp_document_highlight', { clear = false })
        vim.api.nvim_clear_autocmds({ buffer = bufnr, group = 'lsp_document_highlight', })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' },
            { group = 'lsp_document_highlight', buffer = bufnr, callback = vim.lsp.buf.document_highlight, })
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' },
            { group = 'lsp_document_highlight', buffer = bufnr, callback = vim.lsp.buf.clear_references, })
    end
end

lspconfig.lua_ls.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT'
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        }
    }
}

lspconfig.clangd.setup {
    on_attach = on_attach,
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
        "--pretty"
    }
}

lspconfig.cmake.setup { on_attach = on_attach }

lspconfig.pyright.setup {
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    }
}

lspconfig.rust_analyzer.setup { on_attach = on_attach }

lspconfig.gopls.setup { on_attach = on_attach }

lspconfig.bashls.setup { on_attach = on_attach }

local float_border = function()
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or "rounded"
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end
end

local diagnostic_icon = function()
    vim.diagnostic.config({
        virtual_text = true,
        signs = true
    })
    local signs = { Error = " ", Warn = " ", Hint = "ﯧ ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

float_border()
diagnostic_icon()
