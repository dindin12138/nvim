local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

map("n", "s", "", opt)
map("n", "H", "5h", opt)
map("n", "J", "5j", opt)
map("n", "K", "5k", opt)
map("n", "L", "5l", opt)

map("n", "<C-h>", ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", opt)
map("n", "<C-j>", ":call VSCodeNotify('workbench.action.navigateDown')<CR>", opt)
map("n", "<C-k>", ":call VSCodeNotify('workbench.action.navigateUp')<CR>", opt)
map("n", "<C-l>", ":call VSCodeNotify('workbench.action.navigateRight')<CR>", opt)

map("n", "sc", ":call VSCodeNotify('workbench.action.closeActiveEditor')<CR>", opt)
map("n", "so", ":call VSCodeNotify('workbench.action.closeAllEditors')<CR>", opt)
map("n", "sh", ":call VSCodeNotify('workbench.action.splitEditorDown')<CR>", opt)
map("n", "sv", ":call VSCodeNotify('workbench.action.splitEditorRight')<CR>", opt)

map("n", "<TAB>", ":call VSCodeNotify('workbench.action.nextEditor')<CR>", opt)

-- map("n", "<leader>e", ":call VSCodeNotify('workbench.view.explorer')<CR>", opt)
map("n", "<leader>ff", ":call VSCodeNotify('workbench.action.quickOpen')<CR>", opt)
map("n", "<leader>j", "<CMD>HopChar2<CR>", opt)

map("n", "<leader>lf", ":call VSCodeNotify('editor.action.formatDocument')<CR>", opt)

map("n", "gr", ":call VSCodeNotify('editor.action.rename')<CR>", opt)
map("n", "gh", ":call VSCodeNotify('editor.action.showHover')<CR>", opt)
map("n", "gd", ":call VSCodeNotify('editor.action.revealDeclaration')<CR>", opt)
map("n", "gp", ":call VSCodeNotify('editor.action.peekDefinition')<CR>", opt)
map("n", "gl", ":call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>", opt)
map("n", "ga", ":call VSCodeNotify('editor.action.quickFix')<CR>", opt)
