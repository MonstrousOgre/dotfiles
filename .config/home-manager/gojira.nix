# Host-specific configuration for "gojira" (Linux, x86_64).
#
# Common configuration lives in common.nix and is imported below; add anything
# that only applies to this machine here.
{
  lib,
  pkgs,
  qml-language-server,
  ...
}: {
  imports = [
    ./common.nix
  ];

  home.homeDirectory = "/home/ogre";

  gtk = {
    enable = true;
    iconTheme = {
      name = "Colloid-Dark"; # Check exact folder name inside pkgs.colloid-icon-theme
      package = pkgs.colloid-icon-theme;
    };
  };

  # Configure Qt6 to use Kvantum
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  # Write the dark color palette file expected by KDE frameworks / Dolphin
  xdg.configFile."kdeglobals".text = ''
    [Colors:Window]
    BackgroundNormal=30,30,30
    ForegroundNormal=239,240,241

    [Colors:View]
    BackgroundNormal=30,30,30
    ForegroundNormal=239,240,241

    [Colors:Button]
    BackgroundNormal=45,45,45
    ForegroundNormal=239,240,241

    [Colors:Selection]
    BackgroundNormal=61,174,233
    ForegroundNormal=255,255,255

    [Icons]
    Theme=Colloid-Dark

    [General]
    ColorScheme=BreezeDark
  '';

  # Linux-only packages: QML tooling is Linux-only (qtdeclarative and the
  # qml-language-server flake don't build on macOS), plus GTK theming.
  home.packages = with pkgs; [
    qt6.qtdeclarative
    qml-language-server.packages.${pkgs.stdenv.hostPlatform.system}.default

    whitesur-kde
    whitesur-gtk-theme

    colloid-icon-theme
  ];

  # # Set user environment variables
  # home.sessionVariables = lib.optionalAttrs pkgs.stdenv.hostPlatform.isLinux {
  #   QT_QPA_PLATFORM = "wayland;xcb";
  #   QT_QPA_PLATFORMTHEME = "kvantum";
  #   QT_STYLE_OVERRIDE = "kvantum";
  # };
}
