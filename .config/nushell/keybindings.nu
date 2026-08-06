$env.config.keybindings = [
    {
        name: ide_completion_menu
        modifier: none
        keycode: tab
        mode: [emacs vi_normal vi_insert]
        event: {
            until: [
                {send: menu, name: ide_completion_menu}
                {send: menunext}
                {edit: complete}
            ]
        }
    },
    {
        name: accept_history_hint_ctrl_enter
        modifier: control
        keycode: space
        mode: [emacs, vi_normal, vi_insert]
        event: { send: HistoryHintComplete }
    } 
]
