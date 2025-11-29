-- Wrapper around vim.keymap.set that will
-- not create a keymap if a lazy key handler exists.
-- It will also set `silent` to true by default.
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  local modes = type(mode) == "string" and { mode } or mode

  ---@param m string
  modes = vim.tbl_filter(function(m)
    return not (keys.have and keys:have(lhs, m))
  end, modes)

  -- do not create the keymap if a lazy keys handler exists
  if #modes > 0 then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      ---@diagnostic disable-next-line: no-unknown
      opts.remap = nil
    end
    vim.keymap.set(modes, lhs, rhs, opts)
  end
end

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- quick move
map("n", "<S-j>", "5j", { desc = "Fast down" })
map("n", "<S-k>", "5k", { desc = "Fast up" })
map("i", "<C-b>", "<esc>I", { desc = "Move to beginning of line" })
map("i", "<C-e>", "<end>", { desc = "Move to end of line" })
map("i", "<C-h>", "<Left>", { desc = "Move Left" })
map("i", "<C-j>", "<Down>", { desc = "Move Down" })
map("i", "<C-k>", "<Up>", { desc = "Move Up" })
map("i", "<C-l>", "<Right>", { desc = "Move Right" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- windows
map("n", "<leader>sj", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>sl", "<C-W>v", { desc = "Split window right", remap = true })

-- Move Lines
-- map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<S-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<S-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<leader>q", "<cmd>Bdelete!<cr>", { desc = "Delete buffer" })
map("n", "<leader>x", "<cmd>BufferLinePickClose<cr>", { desc = "Close the selected buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map({ "x", "n", "s" }, "W", "<cmd>w<cr><esc>", { desc = "Save file" })

-- quit quickly
map("n", "Q", "<cmd>qa<cr>", { desc = "Quit all" })

-- better indenting
map("v", "<", "<gv", { desc = "Indent forward" })
map("v", ">", ">gv", { desc = "Indent backward" })

-- lazy
map("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
-- map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- comment
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })
map("n", "<C-/>", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })
map(
  "v",
  "<leader>/",
  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  { desc = "Toggle comment" }
)
map(
  "v",
  "<C-/>",
  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  { desc = "Toggle comment" }
)

-- close
map("n", "<leader>c", "<cmd>close<cr>", { desc = "Close this window" })

-- Neotree
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorer NeoTree" })

-- Telescope
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>",
  { desc = "Find all files" }
)
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Oldfiles" })
map("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Projects" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help page" })
map("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
map("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Git status" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })

-- LSP
map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LspInfo" })
map("n", "<leader>ll", "<cmd>LspLog<cr>", { desc = "LspLog" })
map("n", "<leader>lr", "<cmd>LspRestart<cr>", { desc = "LspRestart" })
map("n", "<leader>lf", function()
  require("conform").format()
end, { desc = "Format" })
map("n", "<leader>lt", "<cmd>TroubleToggle<cr>", { desc = "Trouble" })
map("n", "<leader>la", "<cmd>AerialToggle<cr>", { desc = "AerialToggle" })

-- lazy
map("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Mason
map("n", "<leader>m", "<cmd>Mason<cr>", { desc = "Mason" })
