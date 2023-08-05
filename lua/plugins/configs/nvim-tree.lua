return {
    disable_netrw = true,
    hijack_cursor = true,
    respect_buf_cwd = true,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = false,
    },
    git = { enable = false, ignore = false },
    filters = { dotfiles = true },
    renderer = { root_folder_label = false },
    view = {
        width = 25,
        mappings = {
            custom_only = false,
            list = {
                { key = { "l", "o", "<CR>" }, action = "edit" },
                { key = "v",                  action = "vsplit" },
                { key = "h",                  action = "split" },
                { key = "i",                  action = "toggle_git_ignored" },
                { key = ".",                  action = "toggle_dotfiles" },
                { key = "<F5>",               action = "refresh" },
                { key = "a",                  action = "create" },
                { key = "d",                  action = "remove" },
                { key = "r",                  action = "rename" },
                { key = "x",                  action = "cut" },
                { key = "y",                  action = "copy" },
                { key = "p",                  action = "paste" },
            },
        },
    },
}
