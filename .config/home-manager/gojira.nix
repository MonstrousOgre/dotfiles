# Host-specific configuration for "gojira" (Linux, x86_64).
#
# Common configuration lives in common.nix and is imported below; add anything
# that only applies to this machine here.
{
  pkgs,
  qml-language-server,
  ...
}: {
  imports = [
    ./common.nix
  ];

  home.homeDirectory = "/home/ogre";

  # Linux-only packages: QML tooling is Linux-only (qtdeclarative and the
  # qml-language-server flake don't build on macOS), plus GTK theming.
  home.packages = with pkgs; [
    qt6.qtdeclarative
    qml-language-server.packages.${pkgs.stdenv.hostPlatform.system}.default

    colloid-gtk-theme
    colloid-icon-theme
  ];

  # Linux-specific packages and options go here.
}