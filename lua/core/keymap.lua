local M = {}

M.normal_key = {
    ["W"] = { "<cmd>write<cr>", "Save" },
    ["<C-s>"] = { "<cmd>write<cr>", "Save" },
    ["Q"] = { "<cmd>qa<cr>", "Quit" },
    ["<C-h>"] = { "<C-w>h", "Move to left window" },
    ["<C-j>"] = { "<C-w>j", "Move to down window" },
    ["<C-k>"] = { "<C-w>k", "Move to up window" },
    ["<C-l>"] = { "<C-w>l", "Move to right window" },
    ["<C-Left>"] = { "<cmd>vertical resize -2<cr>", "Resize window" },
    ["<C-Down>"] = { "<cmd>resize +2<cr>", "Resize window" },
    ["<C-Up>"] = { "<cmd>resize -2<cr>", "Resize window" },
    ["<C-Right>"] = { "<cmd>vertical resize +2<cr>", "Resize window" },
    ["s="] = { "<C-w>=", "Resize window" },
    ["H"] = { "5h", "Fast move" },
    ["J"] = { "5j", "Fast move" },
    ["K"] = { "5k", "Fast move" },
    ["L"] = { "5l", "Fast move" },
    ["<Tab>"] = { "<cmd>BufferLineCycleNext<cr>", "Next buffer" },
    ["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<cr>", "Prev buffer" },
    ["<leader>"] = {
        c = { ":close<cr>", "Close this window" },
        e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
        f = {
            name = "Telescope",
            b = { "<cmd>Telescope buffers<cr>", "Buffers" },
            g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
            f = { "<cmd>Telescope find_files<cr>", "Find files" },
            o = { "<cmd>Telescope oldfiles<cr>", "Oldfiles" },
            p = { "<cmd>Telescope projects<cr>", "Projects" },
            h = { "<cmd>Telescope help_tags<cr>", "Help tags" },
            c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
            s = { "<cmd>Telescope git_status<cr>", "Git status" },
            k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        },
        l = {
            name = "Lsp Config & Lazy",
            i = { "<cmd>LspInfo<cr>", "LspInfo" },
            l = { "<cmd>LspLog<cr>", "LspLog" },
            r = { "<cmd>LspRestart<cr>", "LspRestart" },
            f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
            h = { "<cmd>Lazy home<cr>", "Lazy home" },
            s = { "<cmd>Lazy sync<cr>", "Lazy sync" },
            t = { "<cmd>TroubleToggle<cr>", "Trouble" },
            o = { "<cmd>SymbolsOutline<cr>", "SymbolsOutline" }
        },
        m = { "<cmd>Mason<cr>", "Mason" },
        o = { ":only<cr>", "Close all but this window" },
        q = { "<cmd>Bdelete!<cr>", "Bdelete" },
        s = {
            name = "Split window",
            v = { ":vsp<cr>", "Vertical split window" },
            h = { ":sp<cr>", "Horizontal split window" },
        },
        t = {
            name = "Terminal",
            f = { "<cmd>lua _floaterm_toggle()<cr>", "Toggle floating terminal" },
            l = { "<cmd>lua _lazygit_toggle()<cr>", "Toggle lazygit terminal" },
            h = { "<cmd>ToggleTerm<cr>", "Toggle horizontal terminal" },
        },
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
        ["/"] = { function() require("Comment.api").toggle.linewise.current() end, "Toggle comment" }
    },
    ["<C-/>"] = { function() require("Comment.api").toggle.linewise.current() end, "Toggle comment" },
    ["g"] = {
        name = "LSP",
        n = { "Rename" },
        a = { "Code action" },
        d = { "Definition" },
        D = { "Declaration" },
        h = { "Hover" },
        s = { "Signature help" },
        r = { "References" },
        e = { "Open float diagnostics" },
        j = { "Goto next diagnostic" },
        k = { "Goto prev diagnostic" }
    }
}

M.insert_key = {
    ["<C-b>"] = { "<ESC>I", "Move to beginning of line" },
    ["<C-e>"] = { "<End>", "Move to end of line" },
    ["<C-h>"] = { "<Left>", "Move Left" },
    ["<C-j>"] = { "<Down>", "Move Down" },
    ["<C-k>"] = { "<Up>", "Move Up" },
    ["<C-l>"] = { "<Right>", "Move Right" }
}

M.visual_key = {
    ["J"] = { ":m \'>+1<cr>gv=gv", "Select down" },
    ["K"] = { ":m \'<-2<cr>gv=gv", "Select up" },
    ["<"] = { "<gv", "Select left" },
    [">"] = { ">gv", "Select right" },
    ["<leader>/"] = { "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
        "Toggle comment" },
    ["<C-/>"] = { "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
        "Toggle comment" }
}

M.terminal_key = {
    ["<Esc>"] = { "<C-\\><C-n>", "Exit terminal mode" },
    ["<C-h>"] = { "<cmd>wincmd h<cr>", "Move to left window" },
    ["<C-j>"] = { "<cmd>wincmd j<cr>", "Move to down window" },
    ["<C-k>"] = { "<cmd>wincmd k<cr>", "Move to up window" },
    ["<C-l>"] = { "<cmd>wincmd l<cr>", "Move to right window" },
}

return M
