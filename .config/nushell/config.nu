$env.config = {
    history: {file_format: "sqlite", sync_on_enter: true, ignore_space_prefixed: true}
    show_banner: false
    edit_mode: "vi"
    cursor_shape: {vi_insert: "blink_line", vi_normal: "blink_block"}
    use_kitty_protocol: true
    table: {}
}

source keybindings.nu
source aliases.nu

source ~/.cache/carapace/init.nu

source ~/.zoxide.nu

$env.config = ($env.config)

# starship prompt

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
