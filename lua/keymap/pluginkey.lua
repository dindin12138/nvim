local keymap = require('core.keymap')
local map, silent, noremap = keymap.map, keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- usage of plugins
map {
    -- packer
    -- { 'n', '<Leader>ps', cmd('PackerSync'), opts(noremap, silent) },
    -- { 'n', '<Leader>pu', cmd('PackerUpdate'), opts(noremap, silent) },
    -- { 'n', '<Leader>pi', cmd('PackerInstall'), opts(noremap, silent) },
    -- { 'n', '<Leader>pc', cmd('PackerCompile'), opts(noremap, silent) },
    -- nvimtree
    -- { 'n', '<Leader>e', cmd('NvimTreeToggle'), opts(noremap, silent) },
    -- Telescope
    -- { 'n', '<Leader>fb', cmd('Telescope buffers'), opts(noremap, silent) },
    -- { 'n', '<Leader>fa', cmd('Telescope live_grep'), opts(noremap, silent) },
    -- { 'n', '<Leader>ff', cmd('Telescope find_files'), opts(noremap, silent) },
    -- { 'n', '<Leader>fo', cmd('Telescope oldfiles'), opts(noremap, silent) },
    -- { 'n', '<Leader>fe', cmd('Telescope env'), opts(noremap, silent) },
    -- { 'n', '<Leader>fp', cmd('Telescope projects'), opts(noremap, silent) },
    -- { 'n', '<Leader>fs', cmd('Telescope session-lens search_session'), opts(noremap, silent) },
    -- buffer
    { 'n', '<C-n>', cmd('BufferLineCycleNext'), opts(noremap, silent) },
    -- { 'n', '<leader>q', cmd('Bdelete!'), opts(noremap, silent) },
    -- { 'n', '<leader>x', cmd('BufferLinePickClose'), opts(noremap, silent) },
    -- { 'n', '<leader>1', cmd('BufferLineGoToBuffer 1'), opts(noremap, silent) },
    -- { 'n', '<leader>2', cmd('BufferLineGoToBuffer 2'), opts(noremap, silent) },
    -- { 'n', '<leader>3', cmd('BufferLineGoToBuffer 3'), opts(noremap, silent) },
    -- { 'n', '<leader>4', cmd('BufferLineGoToBuffer 4'), opts(noremap, silent) },
    -- { 'n', '<leader>5', cmd('BufferLineGoToBuffer 5'), opts(noremap, silent) },
    -- { 'n', '<leader>6', cmd('BufferLineGoToBuffer 6'), opts(noremap, silent) },
    -- { 'n', '<leader>7', cmd('BufferLineGoToBuffer 7'), opts(noremap, silent) },
    -- { 'n', '<leader>8', cmd('BufferLineGoToBuffer 8'), opts(noremap, silent) },
    -- { 'n', '<leader>9', cmd('BufferLineGoToBuffer 9'), opts(noremap, silent) },
    -- lsp
    -- { 'n', '<Leader>li', cmd('LspInfo'), opts(noremap, silent) },
    -- { 'n', '<Leader>ll', cmd('LspLog'), opts(noremap, silent) },
    -- { 'n', '<Leader>lr', cmd('LspRestart'), opts(noremap, silent) },
    -- { 'n', '<leader>f', cmd('lua vim.lsp.buf.formatting()'), opts(noremap, silent) },
    -- lspsaga
    { 'n', 'gr', cmd('Lspsaga rename'), opts(noremap, silent) },
    { 'n', 'ga', cmd('Lspsaga code_action'), opts(noremap, silent) },
    { 'n', 'gp', cmd('Lspsaga preview_definition'), opts(noremap, silent) },
    { 'n', 'gd', cmd('lua vim.lsp.buf.definition()'), opts(noremap, silent) },
    { 'n', 'gh', cmd('Lspsaga hover_doc'), opts(noremap, silent) },
    { 'n', 'gl', cmd('Lspsaga lsp_finder'), opts(noremap, silent) },
    { 'n', 'gs', cmd('Lspsaga signature_help'), opts(noremap, silent) },
    { 'n', 'ge', cmd('Lspsaga show_line_diagnostics'), opts(noremap, silent) },
    { 'n', 'gj', cmd('Lspsaga diagnostic_jump_next'), opts(noremap, silent) },
    { 'n', 'gk', cmd('Lspsaga diagnostic_jump_prev'), opts(noremap, silent) },
    { 'n', '<C-d>', cmd("lua require('lspsaga.action').smart_scroll_with_saga(1)"), opts(noremap, silent) },
    { 'n', '<C-u>', cmd("lua require('lspsaga.action').smart_scroll_with_saga(-1)"), opts(noremap, silent) },
    -- aerial
    -- { 'n', '<leader>o', cmd('AerialToggle! right'), opts(noremap, silent) },
    -- startuptime
    -- { 'n', '<leader>st', cmd('StartupTime'), opts(noremap, silent) },
    -- hop
    -- { 'n', '<Leader>w', cmd('HopWord'), opts(noremap, silent) },
    -- { 'n', '<Leader>j', cmd('HopLine'), opts(noremap, silent) },
    -- { 'n', '<Leader>c', cmd('HopChar1'), opts(noremap, silent) },
    -- session
    -- { 'n', '<leader>ss', cmd('SaveSession'), opts(noremap, silent) },
    -- { 'n', '<leader>sr', cmd('RestoreSession'), opts(noremap, silent) },
    -- { 'n', '<leader>sd', cmd('DeleteSession'), opts(noremap, silent) },
}

local which_key = {
    ["<leader>"] = {
        p = {
            name = "Packer",
            c = { "<cmd>PackerCompile<cr>", "Compile" },
            i = { "<cmd>PackerInstall<cr>", "Install" },
            s = { "<cmd>PackerSync<cr>", "Sync" },
            S = { "<cmd>PackerStatus<cr>", "Status" },
            u = { "<cmd>PackerUpdate<cr>", "Update" },
        },
        e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
        f = {
            name = "Telescope",
            b = { "<cmd>Telescope buffers<cr>", "buffers" },
            a = { "<cmd>Telescope live_grep<cr>", "live_grep" },
            f = { "<cmd>Telescope find_files<cr>", "find_files" },
            o = { "<cmd>Telescope oldfiles<cr>", "oldfiles" },
            e = { "<cmd>Telescope env<cr>", "env" },
            p = { "<cmd>Telescope projects<cr>", "projects" },
        },
        q = { "<cmd>Bdelete!<cr>", "Bdelete" },
        x = { "<cmd>BufferLinePickClose<cr>", "Buffer Pick Close" },
        ["1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "Go To Buffer 1" },
        ["2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "Go To Buffer 2" },
        ["3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "Go To Buffer 3" },
        ["4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "Go To Buffer 4" },
        ["5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "Go To Buffer 5" },
        ["6"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "Go To Buffer 6" },
        ["7"] = { "<cmd>BufferLineGoToBuffer 7<cr>", "Go To Buffer 7" },
        ["8"] = { "<cmd>BufferLineGoToBuffer 8<cr>", "Go To Buffer 8" },
        ["9"] = { "<cmd>BufferLineGoToBuffer 9<cr>", "Go To Buffer 9" },
        l = {
            name = "LSP",
            i = { "<cmd>LspInfo<cr>", "LspInfo" },
            l = { "<cmd>LspLog<cr>", "LspLog" },
            r = { "<cmd>LspRestart<cr>", "LspRestart" },
            f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
        },
        o = { "<cmd>AerialToggle! right<cr>", "Aerial" },
        s = { t = { "<cmd>StartupTime<cr>", "StartupTime" } },
        w = { "<cmd>HopWord<cr>", "HopWord" },
        j = { "<cmd>HopLine<cr>", "HopLine" },
        c = { "<cmd>HopChar1<cr>", "HopChar1" },
    },
    ["g"] = {
        name = "lspsaga",
        r = { "rename" },
        a = { "code_action" },
        p = { "preview_definition" },
        d = { "definition" },
        h = { "hover_doc" },
        l = { "lsp_finder" },
        s = { "signature_help" },
        e = { "show_line_diagnostics" },
        j = { "diagnostic_jump_next" },
        k = { "diagnostic_jump_prev" },
    },
    ["s"] = {
        name = "split window",
        v = { ":vsp<CR>", "vertical split window" },
        h = { ":sp<CR>", "horizontal split window" },
        c = { ":close<CR>", "close this window" },
        o = { ":only<CR>", "close all but this window" },
    },
}

return which_key
