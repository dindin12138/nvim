require('keymap.config')
local keymap = require('core.keymap')
local map = keymap.map
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- usage of plugins
map {
    -- packer
    { 'n', '<Leader>ps', cmd('PackerSync'), opts(noremap, silent) },
    { 'n', '<Leader>pu', cmd('PackerUpdate'), opts(noremap, silent) },
    { 'n', '<Leader>pi', cmd('PackerInstall'), opts(noremap, silent) },
    { 'n', '<Leader>pc', cmd('PackerCompile'), opts(noremap, silent) },
    -- nvimtree
    { 'n', '<Leader>e', cmd('NvimTreeToggle'), opts(noremap, silent) },
    -- Telescope
    { 'n', '<Leader>b', cmd('Telescope buffers'), opts(noremap, silent) },
    { 'n', '<Leader>fa', cmd('Telescope live_grep'), opts(noremap, silent) },
    { 'n', '<Leader>ff', cmd('Telescope find_files'), opts(noremap, silent) },
    { 'n', '<Leader>fo', cmd('Telescope oldfiles'), opts(noremap, silent) },
    { 'n', '<Leader>fe', cmd('Telescope env'), opts(noremap, silent) },
    { 'n', '<Leader>fp', cmd('Telescope projects'), opts(noremap, silent) },
    -- buffer
    { 'n', '<C-n>', cmd('BufferLineCycleNext'), opts(noremap, silent) },
    { 'n', '<leader>q', cmd('Bdelete!'), opts(noremap, silent) },
    { 'n', '<leader>x', cmd('BufferLinePickClose'), opts(noremap, silent) },
    { 'n', '<leader>1', cmd('BufferLineGoToBuffer 1'), opts(noremap, silent) },
    { 'n', '<leader>2', cmd('BufferLineGoToBuffer 2'), opts(noremap, silent) },
    { 'n', '<leader>3', cmd('BufferLineGoToBuffer 3'), opts(noremap, silent) },
    { 'n', '<leader>4', cmd('BufferLineGoToBuffer 4'), opts(noremap, silent) },
    { 'n', '<leader>5', cmd('BufferLineGoToBuffer 5'), opts(noremap, silent) },
    { 'n', '<leader>6', cmd('BufferLineGoToBuffer 6'), opts(noremap, silent) },
    { 'n', '<leader>7', cmd('BufferLineGoToBuffer 7'), opts(noremap, silent) },
    { 'n', '<leader>8', cmd('BufferLineGoToBuffer 8'), opts(noremap, silent) },
    { 'n', '<leader>9', cmd('BufferLineGoToBuffer 9'), opts(noremap, silent) },
    -- lsp
    { 'n', '<Leader>li', cmd('LspInfo'), opts(noremap, silent) },
    { 'n', '<Leader>ll', cmd('LspLog'), opts(noremap, silent) },
    { 'n', '<Leader>lr', cmd('LspRestart'), opts(noremap, silent) },
    { 'n', '<leader>f', cmd('lua vim.lsp.buf.formatting()'), opts(noremap, silent) },
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
}
