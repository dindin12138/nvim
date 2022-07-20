require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = { "dashboard" },
    open_on_tab = false,
    hijack_cursor = true,
    diagnostics = {
        enable = false,
        icons = { hint = "", info = "", warning = "", error = "" },
    },
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    system_open = { cmd = nil, args = {} },
    git = { enable = true, ignore = true, timeout = 500 },
    filters = { dotfiles = false, custom = {} },
    view = {
        width = 30,
        height = 30,
        side = 'left',
        hide_root_folder = false,
        number = false,
        relativenumber = false,
        signcolumn = 'yes',
        mappings = {
            custom_only = false,
            list = require('keybindings').nvimTreeList,
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    actions = {
        open_file = {
            resize_window = true,
            quit_on_open = false,
        },
    },
})

-- with relative path
require "nvim-tree.events".on_file_created(function(file) vim.cmd("edit " .. file.fname) end)

-- 自动关闭
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
