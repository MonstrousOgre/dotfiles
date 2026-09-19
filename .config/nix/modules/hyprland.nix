{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.my.desktop.hyprland;
in {
  options.my.desktop.hyprland.enable =
    lib.mkEnableOption "my Hyprland desktop configuration";

  imports = [inputs.qtengine.nixosModules.default];

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
}
