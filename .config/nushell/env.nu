if (uname).kernel-name == "Darwin" {
    source ./homebrew.nu
}

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

zoxide init nushell | save -f ~/.zoxide.nu

$env.NU_STARTED = 'yes'
