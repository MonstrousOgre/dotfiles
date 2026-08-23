{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.desktop.hyprland;
in {
  options.my.desktop.hyprland.enable =
    lib.mkEnableOption "my Hyprland desktop configuration";

  config = lib.mkIf cfg.enable {
    programs.hyprland.enable = true;

    environment.systemPackages = with pkgs; [
      hypridle
      hyprpaper
      hyprpolkitagent
      playerctl
      ags
      # networkmanagerapplet
      hypridle
      gtklock
      rofi
    ];
  };
}
