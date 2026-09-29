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

  # Configure Qt6 to use Kvantum
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  home.packages = with pkgs; [
    qt6.qtdeclarative
    qml-language-server.packages.${pkgs.stdenv.hostPlatform.system}.default

    whitesur-kde
    whitesur-gtk-theme

    (pkgs.colloid-icon-theme.override {
      colorVariants = ["pink"];
    })
  ];

  # # Set user environment variables
  # home.sessionVariables = lib.optionalAttrs pkgs.stdenv.hostPlatform.isLinux {
  #   QT_QPA_PLATFORM = "wayland;xcb";
  #   QT_QPA_PLATFORMTHEME = "kvantum";
  #   QT_STYLE_OVERRIDE = "kvantum";
  # };
}
