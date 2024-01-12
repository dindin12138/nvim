-- Automatically saves edits to the buffer
-- vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
--     pattern = { "*" },
--     command = "silent! wall",
--     nested = true,
-- })

-- Reopen the buffer to restore the cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.fn.setpos(".", vim.fn.getpos("'\""))
      vim.cmd("silent! foldopen")
    end
  end,
})

-- Close new line comments
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})

-- use conform.format() just like you would vim.lsp.buf.format()
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf, lsp_fallback = true })
  end,
})

-- Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  -- stylua: ignore
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local map = vim.keymap.set
    -- local bufopts = { noremap = true, silent = true, buffer = ev.buf }
    map("n", "ga", "<CMD>lua vim.lsp.buf.code_action()<CR>",
      { desc = "Code action", noremap = true, silent = true, buffer = ev.buf })
    map("n", "gn", "<CMD>lua vim.lsp.buf.rename()<CR>",
      { desc = "Rename", noremap = true, silent = true, buffer = ev.buf })
    map("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>",
      { desc = "Definition", noremap = true, silent = true, buffer = ev.buf })
    map("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>",
      { desc = "Declaration", noremap = true, silent = true, buffer = ev.buf })
    map("n", "gh", "<CMD>lua vim.lsp.buf.hover()<CR>", { desc = "Hover", noremap = true, silent = true, buffer = ev.buf })
    map("n", "gs", "<CMD>lua vim.lsp.buf.signature_help()<CR>",
      { desc = "Signature help", noremap = true, silent = true, buffer = ev.buf })
    map("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>",
      { desc = "References", noremap = true, silent = true, buffer = ev.buf })
    map("n", "ge", "<CMD>lua vim.diagnostic.open_float()<CR>",
      { desc = "Open float diagnostics", noremap = true, silent = true, buffer = ev.buf })
    map("n", "gj", "<CMD>lua vim.diagnostic.goto_next()<CR>",
      { desc = "Goto next diagnostic", noremap = true, silent = true, buffer = ev.buf })
    map("n", "gk", "<CMD>lua vim.diagnostic.goto_prev()<CR>",
      { desc = "Goto prev diagnostic", noremap = true, silent = true, buffer = ev.buf })
  end,
})

vim.api.nvim_create_autocmd("BufRead", {
  group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
  pattern = "Cargo.toml",
  callback = function()
    require("cmp").setup.buffer({ sources = { { name = "crates" } } })
  end,
})

-- load gitsigns only when a git file is opened
vim.api.nvim_create_autocmd({ "BufRead" }, {
  group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
  callback = function()
    vim.fn.jobstart({ "git", "-C", vim.loop.cwd(), "rev-parse" }, {
      on_exit = function(_, return_code)
        if return_code == 0 then
          vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
          vim.schedule(function()
            require("lazy").load({ plugins = { "gitsigns.nvim" } })
          end)
        end
      end,
    })
  end,
})
