local M = {}

M.normal_key = {
  ["W"] = { "<CMD>write<CR><Esc>", "Save file" },
  ["<C-s>"] = { "<CMD>write<CR><Esc>", "Save file" },
  ["Q"] = { "<CMD>qa<CR>", "Quit" },
  ["<C-h>"] = { "<C-w>h", "Go to left window" },
  ["<C-j>"] = { "<C-w>j", "Go to down window" },
  ["<C-k>"] = { "<C-w>k", "Go to up window" },
  ["<C-l>"] = { "<C-w>l", "Go to right window" },
  ["<C-Left>"] = { "<CMD>vertical resize -2<CR>", "Decrease window width" },
  ["<C-Down>"] = { "<CMD>resize +2<CR>", "Decrease window height" },
  ["<C-Up>"] = { "<CMD>resize -2<CR>", "Increase window height" },
  ["<C-Right>"] = { "<CMD>vertical resize +2<CR>", "Increase window width" },
  ["s="] = { "<C-w>=", "Resize window" },
  ["H"] = { "5h", "Fast left" },
  ["J"] = { "5j", "Fast down" },
  ["K"] = { "5k", "Fast up" },
  ["L"] = { "5l", "Fast right" },
  ["<Tab>"] = { "<CMD>BufferLineCycleNext<CR>", "Next buffer" },
  ["<S-Tab>"] = { "<CMD>BufferLineCyclePrev<CR>", "Prev buffer" },
  ["<Esc>"] = { "<CMD>noh<CR><Esc>", "Escape and clear hlsearch" },
  ["<leader>"] = {
    c = { ":close<CR>", "Close this window" },
    e = { "<CMD>Neotree toggle<CR>", "Explorer" },
    f = {
      name = "Telescope",
      b = { "<CMD>Telescope buffers<CR>", "Buffers" },
      g = { "<CMD>Telescope live_grep<CR>", "Live grep" },
      f = { "<CMD>Telescope find_files<CR>", "Find files" },
      a = { "<CMD>Telescope find_files follow=true no_ignore=true hidden=true<CR>", "Find all files" },
      o = { "<CMD>Telescope oldfiles<CR>", "Oldfiles" },
      p = { "<CMD>Telescope projects<CR>", "Projects" },
      h = { "<CMD>Telescope help_tags<CR>", "Help page" },
      c = { "<CMD>Telescope git_commits<CR>", "Git commits" },
      s = { "<CMD>Telescope git_status<CR>", "Git status" },
      k = { "<CMD>Telescope keymaps<CR>", "Keymaps" },
    },
    l = {
      name = "Lsp Config & Lazy",
      i = { "<CMD>LspInfo<CR>", "LspInfo" },
      l = { "<CMD>LspLog<CR>", "LspLog" },
      r = { "<CMD>LspRestart<CR>", "LspRestart" },
      f = {
        function()
          require("conform").format()
        end,
        "Format",
      },
      z = { "<CMD>Lazy<CR>", "Lazy" },
      s = { "<CMD>Lazy sync<CR>", "Lazy sync" },
      t = { "<CMD>TroubleToggle<CR>", "Trouble" },
      o = { "<CMD>SymbolsOutline<CR>", "SymbolsOutline" },
    },
    m = { "<CMD>Mason<CR>", "Mason" },
    o = { ":only<CR>", "Close all but this window" },
    q = { "<CMD>Bdelete!<CR>", "Bdelete" },
    s = {
      name = "Split window",
      v = { ":vsp<CR>", "Vertical split window" },
      h = { ":sp<CR>", "Horizontal split window" },
    },
    t = {
      name = "Terminal",
      f = { "<CMD>lua _floaterm_toggle()<CR>", "Toggle floating terminal" },
      l = { "<CMD>lua _lazygit_toggle()<CR>", "Toggle lazygit terminal" },
      h = { "<CMD>ToggleTerm<CR>", "Toggle horizontal terminal" },
    },
    x = { "<CMD>BufferLinePickClose<CR>", "Buffer Pick Close" },
    ["1"] = { "<CMD>BufferLineGoToBuffer 1<CR>", "Go To Buffer 1" },
    ["2"] = { "<CMD>BufferLineGoToBuffer 2<CR>", "Go To Buffer 2" },
    ["3"] = { "<CMD>BufferLineGoToBuffer 3<CR>", "Go To Buffer 3" },
    ["4"] = { "<CMD>BufferLineGoToBuffer 4<CR>", "Go To Buffer 4" },
    ["5"] = { "<CMD>BufferLineGoToBuffer 5<CR>", "Go To Buffer 5" },
    ["6"] = { "<CMD>BufferLineGoToBuffer 6<CR>", "Go To Buffer 6" },
    ["7"] = { "<CMD>BufferLineGoToBuffer 7<CR>", "Go To Buffer 7" },
    ["8"] = { "<CMD>BufferLineGoToBuffer 8<CR>", "Go To Buffer 8" },
    ["9"] = { "<CMD>BufferLineGoToBuffer 9<CR>", "Go To Buffer 9" },
    ["/"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },
  ["<C-/>"] = {
    function()
      require("Comment.api").toggle.linewise.current()
    end,
    "Toggle comment",
  },
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
    k = { "Goto prev diagnostic" },
  },
}

M.insert_key = {
  ["<Esc>"] = { "<CMD>noh<CR><Esc>", "Escape and clear hlsearch" },
  ["<C-s>"] = { "<CMD>write<CR><Esc>", "Save file" },
  ["<C-b>"] = { "<Esc>I", "Move to beginning of line" },
  ["<C-e>"] = { "<End>", "Move to end of line" },
  ["<C-h>"] = { "<Left>", "Move Left" },
  ["<C-j>"] = { "<Down>", "Move Down" },
  ["<C-k>"] = { "<Up>", "Move Up" },
  ["<C-l>"] = { "<Right>", "Move Right" },
}

M.visual_key = {
  ["<C-s>"] = { "<CMD>write<CR><Esc>", "Save file" },
  ["J"] = { ":m '>+1<CR>gv=gv", "Select down" },
  ["K"] = { ":m '<-2<CR>gv=gv", "Select up" },
  ["<"] = { "<gv", "Select left" },
  [">"] = { ">gv", "Select right" },
  ["<leader>/"] = {
    "<Esc><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    "Toggle comment",
  },
  ["<C-/>"] = {
    "<Esc><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    "Toggle comment",
  },
}

M.terminal_key = {
  ["<Esc>"] = { "<C-\\><C-n>", "Exit terminal mode" },
  ["<C-h>"] = { "<CMD>wincmd h<CR>", "Move to left window" },
  ["<C-j>"] = { "<CMD>wincmd j<CR>", "Move to down window" },
  ["<C-k>"] = { "<CMD>wincmd k<CR>", "Move to up window" },
  ["<C-l>"] = { "<CMD>wincmd l<CR>", "Move to right window" },
}

return M
