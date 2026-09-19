{
  config,
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ogre";
  # home.homeDirectory = "/Users/ogre";
  home.homeDirectory =
    if pkgs.stdenv.hostPlatform.isDarwin
    then "/Users/ogre"
    else "/home/ogre";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    nixd
    rustc
    cargo
    python3
    nodejs
    # lua
    # luarocks
    lua5_1
    lua51Packages.luarocks
    nushell
    starship
    carapace
    zoxide
    yazi
    bat
    ripgrep
    lsd
    gitui
    bottom
    tree-sitter
    gnumake

    colloid-gtk-theme
    colloid-icon-theme

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ogre/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    DIR_PERSONAL = "/mnt/Kash/PS";
    XDG_CONFIG_HOME = "$HOME/.config";
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "wezterm";
    MANPAGER = "bat -l man -p";
  };

  home.sessionPath = [
    "$HOME/.cargo/bin"
    "$HOME/.local/bin"
    "$HOME/.luarocks/bin"
    "$HOME/.npm-packages/bin"
    "$HOME/.spicetify"
  ];

  # home-manager.users.ogre = {
  #   programs.zsh.enable = true;
  # };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = [
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];

    shellAliases = {
      sudo = "sudo ";
      sudoedit = "sudoedit ";
      ls = "lsd";
      l = "ls -l";
      la = "ls -a";
      lla = "ls -la";
      lt = "ls --tree";
      vim = "nvim";
      vi = "vim";
      v = "vi";
      cat = "bat";
      yay = "paru";
      upgrade = "topgrade";
      dotconfig = "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME";
      dotconfig-ui = "gitui --directory ~/.dotfiles --workdir ~/";
      lz-dot = "lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME";
    };
    envExtra = ''
      if [ -f "$HOME/.sh-private" ]; then
        source "$HOME/.sh-private"
      fi
    '';
    # initContent = "eval \"$(starship init zsh)\"";

    # history.size = 10000;
    # history.ignoreAllDups = true;
    # history.path = "$HOME/.zsh_history";
    # history.ignorePatterns = ["rm *" "pkill *" "cp *"];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
