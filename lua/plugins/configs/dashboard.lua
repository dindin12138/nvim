return {
    theme = 'doom',
    config = {
        header = {
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
            [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
            [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
            [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
            [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
            [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
            [[]],
            [[]],
        },
        center = {
            {
                icon = '  ',
                icon_hl = 'Title',
                desc = 'Projects                                ',
                desc_hl = 'String',
                key = 'p',
                key_hl = 'Number',
                action = 'Telescope projects'
            },
            {
                icon = '  ',
                icon_hl = 'Title',
                desc = 'Recently Files                          ',
                desc_hl = 'String',
                key = 'o',
                key_hl = 'Number',
                action = 'Telescope oldfiles'
            },
            {
                icon = '  ',
                icon_hl = 'Title',
                desc = 'Find Files                              ',
                desc_hl = 'String',
                key = 'f',
                key_hl = 'Number',
                action = 'Telescope find_files'
            },
            {
                icon = '  ',
                icon_hl = 'Title',
                desc = 'Update Plugins                          ',
                desc_hl = 'String',
                key = 's',
                key_hl = 'Number',
                action = 'Lazy sync',
            },
            {
                icon = '  ',
                icon_hl = 'Title',
                desc = 'Edit Dotfiles                           ',
                desc_hl = 'String',
                key = 'c',
                key_hl = 'Number',
                action = 'edit ~/.config/nvim/lua/core/keymap.lua'
            },
        },
        footer = {
            [[]],
            [[Talk is cheap. Show me the code.]],
        },
    }
}