local keymap = require('core.keymap')
local map = keymap.map
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- Use space as leader key
vim.g.mapleader = " "

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
    { 'n', "sl", cmd('vsp'), opts(noremap, silent) },
    { 'n', "sj", cmd('sp'), opts(noremap, silent) },
    { 'n', "sv", '<C-w>t<C-w>H', opts(noremap, silent) },
    { 'n', "sh", '<C-w>t<C-w>K', opts(noremap, silent) },
    { 'n', "sc", '<C-w>c', opts(noremap, silent) },
    { 'n', "so", '<C-w>o', opts(noremap, silent) },
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
}
