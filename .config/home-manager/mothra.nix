# Host-specific configuration for "mothra" (macOS, Apple Silicon).
#
# Common configuration lives in common.nix and is imported below; add anything
# that only applies to this machine here.
{...}: {
  imports = [
    ./common.nix
  ];

  home.homeDirectory = "/Users/ogre";

  # macOS-specific packages and options go here.
}