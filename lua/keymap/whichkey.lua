local which_key = {
    ["<Tab>"] = { "<cmd>BufferLineCycleNext<cr>", "Next buffer" },
    ["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<cr>", "Prev buffer" },
    ["<leader>"] = {
        e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
        f = {
            name = "Telescope",
            b = { "<cmd>Telescope buffers<cr>", "buffers" },
            g = { "<cmd>Telescope live_grep<cr>", "live_grep" },
            f = { "<cmd>Telescope find_files<cr>", "find_files" },
            o = { "<cmd>Telescope oldfiles<cr>", "oldfiles" },
            p = { "<cmd>Telescope projects<cr>", "projects" },
            h = { "<cmd>Telescope help_tags<cr>", "help_tags" },
            c = { "<cmd>Telescope git_commits<cr>", "git_commits" },
            s = { "<cmd>Telescope git_status<cr>", "git_status" },
            k = { "<cmd>Telescope keymaps<cr>", "keymaps" }
        },
        j = { "<cmd>HopChar2<cr>", "HopChar2" },
        l = {
            name = "Lsp Config & Lazy",
            i = { "<cmd>LspInfo<cr>", "LspInfo" },
            l = { "<cmd>LspLog<cr>", "LspLog" },
            r = { "<cmd>LspRestart<cr>", "LspRestart" },
            f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
            h = { "<cmd>Lazy home<cr>", "Lazy home" },
            s = { "<cmd>Lazy sync<cr>", "Lazy sync" },
            t = { "<cmd>TroubleToggle<cr>", "Trouble" }
        },
        m = { "<cmd>Mason<cr>", "Mason" },
        o = { "<cmd>AerialToggle! right<cr>", "Aerial" },
        p = {
            name = "Packer",
            c = { "<cmd>PackerCompile<cr>", "Compile" },
            i = { "<cmd>PackerInstall<cr>", "Install" },
            s = { "<cmd>PackerSync<cr>", "Sync" },
            S = { "<cmd>PackerStatus<cr>", "Status" },
            u = { "<cmd>PackerUpdate<cr>", "Update" }
        },
        q = { "<cmd>Bdelete!<cr>", "Bdelete" },
        s = { t = { "<cmd>StartupTime<cr>", "StartupTime" } },
        t = {
            name = "Terminal",
            g = { "<cmd>lua lazygit_toggle()<cr>", "LazyGit" },
            f = { "<cmd>lua floaterm_toggle()<cr>", "Floaterm" }
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
        ["/"] = {
            function()
                require("Comment.api").toggle.linewise.current()
            end,
            "toggle comment"
        }
    },
    ["g"] = {
        name = "LSP",
        r = { "rename" },
        a = { "code_action" },
        p = { "peek_definition" },
        d = { "definition" },
        h = { "hover_doc" },
        l = { "lsp_finder" },
        s = { "signature_help" },
        e = { "show_line_diagnostics" },
        j = { "diagnostic_jump_next" },
        k = { "diagnostic_jump_prev" }
    },
    ["s"] = {
        name = "split window",
        v = { ":vsp<CR>", "vertical split window" },
        h = { ":sp<CR>", "horizontal split window" },
        c = { ":close<CR>", "close this window" },
        o = { ":only<CR>", "close all but this window" }
    }
}

return which_key
