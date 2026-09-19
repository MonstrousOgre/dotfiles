{
  description = "Hyprland module";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    qtengine = {
      url = "github:kossLAN/qtengine";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, qtengine, ... }: {
    nixosModules.default = { config, lib, pkgs, ... }: let
      cfg = config.my.desktop.hyprland;
    in {
      imports = [qtengine.nixosModules.default];

      options.my.desktop.hyprland.enable =
        lib.mkEnableOption "my Hyprland desktop configuration";

      config = lib.mkIf cfg.enable {
        programs.hyprland.enable = true;

        programs.qtengine = {
          enable = true;

          config = {
            theme = {
              colorScheme = "/home/ogre/.local/share/color-schemes/LayanDark.colors";
              iconTheme = "breeze-dark";
              style = "kvantum";

              font = {
                family = "Noto Sans";
                size = 11;
                weight = -1;
              };

              fontFixed = {
                family = "Hermit";
                size = 11;
                weight = -1;
              };
            };

            misc = {
              singleClickActivate = false;
              menusHaveIcons = true;
              shortcutsForContextMenus = true;
            };
          };
        };

        environment.systemPackages = with pkgs; [
          hypridle
          hyprpaper
          hyprpolkitagent
          playerctl
          ags
          quickshell
          qt6.qt5compat
          # networkmanagerapplet
          hypridle
          gtklock
          rofi
          kdePackages.breeze
          kdePackages.breeze.qt5 # Needed if you want Qt5 support.
          kdePackages.breeze-icons
          kdePackages.qqc2-desktop-style
          kdePackages.kirigami
        ];
      };
    };
  };
}

