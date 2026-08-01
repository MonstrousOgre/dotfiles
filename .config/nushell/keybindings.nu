$env.config.keybindings = [
    {
        name: ide_completion_menu
        # modifier: control
        modifier: none
        # keycode: char_n
        keycode: tab
        mode: [emacs vi_normal vi_insert]
        event: {
            until: [
                {send: menu, name: ide_completion_menu}
                {send: menunext}
                {edit: complete}
            ]
        }
    }
]
