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
  -- dashboard
  { 'n', '<Leader>n', cmd('DashboardNewFile'), opts(noremap, silent) },
  { 'n', '<Leader>ss', cmd('SessionSave'), opts(noremap, silent) },
  { 'n', '<Leader>sl', cmd('SessionLoad'), opts(noremap, silent) },
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
}
