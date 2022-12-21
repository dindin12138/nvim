local keymap = require('core.keymap')
local map = keymap.map
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- Use space as leader key
-- vim.g.mapleader = " "

-- usage example
map {
    -- leaderkey
    { 'n', ' ', '', opts(noremap) },
    { 'x', ' ', '', opts(noremap) },
    -- noremal remap
    -- save
    { 'n', "<C-s>", cmd('write'), opts(noremap) },
    { 'n', "W", cmd('write'), opts(noremap) },
    -- quit
    { 'n', "Q", cmd('qa!'), opts(noremap) },
    -- yank
    { 'n', "Y", 'y$', opts(noremap) },
    -- window jump
    { 'n', "<C-h>", '<C-w>h', opts(noremap) },
    { 'n', "<C-l>", '<C-w>l', opts(noremap) },
    { 'n', "<C-j>", '<C-w>j', opts(noremap) },
    { 'n', "<C-k>", '<C-w>k', opts(noremap) },
    -- split
    -- { 'n', "sl", cmd('vsp'), opts(noremap, silent) },
    -- { 'n', "sj", cmd('sp'), opts(noremap, silent) },
    -- { 'n', "sv", '<C-w>t<C-w>H', opts(noremap, silent) },
    -- { 'n', "sh", '<C-w>t<C-w>K', opts(noremap, silent) },
    -- { 'n', "sc", '<C-w>c', opts(noremap, silent) },
    -- { 'n', "so", '<C-w>o', opts(noremap, silent) },
    -- resize
    { 'n', "<C-Left>", cmd('vertical resize -2'), opts(noremap, silent) },
    { 'n', "<C-Right>", cmd('vertical resize +2'), opts(noremap, silent) },
    { 'n', "<C-Down>", cmd('resize +2'), opts(noremap, silent) },
    { 'n', "<C-Up>", cmd('resize -2'), opts(noremap, silent) },
    { 'n', "s=", '<C-w>=', opts(noremap, silent) },
    -- fast move
    { 'n', "J", '5j', opts(noremap, silent) },
    { 'n', "K", '5k', opts(noremap, silent) },
    { 'n', "H", '5h', opts(noremap, silent) },
    { 'n', "L", '5l', opts(noremap, silent) },
    -- insert
    { 'i', "<C-h>", '<ESC>I', opts(noremap, silent) },
    { 'i', "<C-l>", '<ESC>A', opts(noremap, silent) },
    -- visual
    { 'v', "J", ':m \'>+1<cr>gv=gv', opts(noremap, silent) },
    { 'v', "K", ':m \'<-2<cr>gv=gv', opts(noremap, silent) },
    { 'v', "<", '<gv', opts(noremap, silent) },
    { 'v', ">", '>gv', opts(noremap, silent) },
    -- terminal "t", "<leader>l", "<Cmd> wincmd l<CR>",
    { 't', "<Esc>", '<C-\\><C-n>', opts(noremap, silent) },
    { 't', "<C-h>", '<Cmd> wincmd h<CR>', opts(noremap, silent) },
    { 't', "<C-j>", '<Cmd> wincmd j<CR>', opts(noremap, silent) },
    { 't', "<C-k>", '<Cmd> wincmd k<CR>', opts(noremap, silent) },
    { 't', "<C-l>", '<Cmd> wincmd l<CR>', opts(noremap, silent) },
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
    -- { 'n', '<C-n>', cmd('BufferLineCycleNext'), opts(noremap, silent) },
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
    -- { 'n', 'gr', cmd('Lspsaga rename'), opts(noremap, silent) },
    -- { 'n', 'ga', cmd('Lspsaga code_action'), opts(noremap, silent) },
    -- { 'n', 'gp', cmd('Lspsaga preview_definition'), opts(noremap, silent) },
    -- { 'n', 'gd', cmd('lua vim.lsp.buf.definition()'), opts(noremap, silent) },
    -- { 'n', 'gh', cmd('Lspsaga hover_doc'), opts(noremap, silent) },
    -- { 'n', 'gl', cmd('Lspsaga lsp_finder'), opts(noremap, silent) },
    -- { 'n', 'gs', cmd('Lspsaga signature_help'), opts(noremap, silent) },
    -- { 'n', 'ge', cmd('Lspsaga show_line_diagnostics'), opts(noremap, silent) },
    -- { 'n', 'gj', cmd('Lspsaga diagnostic_jump_next'), opts(noremap, silent) },
    -- { 'n', 'gk', cmd('Lspsaga diagnostic_jump_prev'), opts(noremap, silent) },
    -- { 'n', '<C-d>', cmd("lua require('lspsaga.action').smart_scroll_with_saga(1)"), opts(noremap, silent) },
    -- { 'n', '<C-u>', cmd("lua require('lspsaga.action').smart_scroll_with_saga(-1)"), opts(noremap, silent) },
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
