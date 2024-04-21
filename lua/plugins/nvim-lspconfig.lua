return {
  "neovim/nvim-lspconfig",
  ft = { "lua", "c", "cpp", "python", "rust", "sh", "go", "sql", "nix" },
  dependencies = {
    { "folke/neodev.nvim", config = true },
    {
      "williamboman/mason-lspconfig.nvim",
      enabled = os.execute("grep -q '^ID=.*nixos' /etc/os-release") == 1,
      config = true,
    },
    { "ray-x/lsp_signature.nvim", config = true },
    { "j-hui/fidget.nvim", tag = "legacy", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")

    local on_attach = function(client, bufnr)
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      -- Highlight symbol under cursor
      if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
        vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "lsp_document_highlight" })
        vim.api.nvim_create_autocmd(
          { "CursorHold", "CursorHoldI" },
          { group = "lsp_document_highlight", buffer = bufnr, callback = vim.lsp.buf.document_highlight }
        )
        vim.api.nvim_create_autocmd(
          { "CursorMoved", "CursorMovedI" },
          { group = "lsp_document_highlight", buffer = bufnr, callback = vim.lsp.buf.clear_references }
        )
      end
      -- Disable hover in favor of Pyright
      if client.name == "ruff_lsp" then
        client.server_capabilities.hoverProvider = false
      end
    end

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        },
      },
    })

    lspconfig.clangd.setup({
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
        "--pretty",
      },
    })

    lspconfig.neocmake.setup({ on_attach = on_attach })

    lspconfig.pyright.setup({
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true,
          },
        },
      },
    })

    lspconfig.ruff_lsp.setup({
      on_attach = on_attach,
      init_options = {
        settings = {
          -- Any extra CLI arguments for `ruff` go here.
          args = {},
        },
      },
    })

    -- lspconfig.pylsp.setup({
    --   on_attach = on_attach,
    --   settings = {
    --     pylsp = {
    --       plugins = {
    --         pycodestyle = { enabled = false },
    --         pylint = { enabled = false },
    --         pyflakes = { enabled = false },
    --         mccabe = { enabled = false },
    --         pydocstyle = { enabled = false },
    --         autopep8 = { enabled = false },
    --         yapf = { enabled = false },
    --         flake8 = { enabled = false },
    --       },
    --     },
    --   },
    -- })

    lspconfig.rust_analyzer.setup({ on_attach = on_attach })

    lspconfig.gopls.setup({ on_attach = on_attach })

    lspconfig.bashls.setup({ on_attach = on_attach })

    lspconfig.sqlls.setup({ on_attach = on_attach })

    lspconfig.nil_ls.setup({ on_attach = on_attach })

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
        signs = true,
      })
      local icons = require("core.icons")
      local signs = {
        Error = icons.diagnostics.Error,
        Warn = icons.diagnostics.Warn,
        Hint = icons.diagnostics.Hint,
        Info = icons.diagnostics.Info,
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end

    float_border()
    diagnostic_icon()
  end,
}
