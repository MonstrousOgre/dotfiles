# Home Manager configuration managed as a Nix flake.
#
# Apply it from this directory with the entry matching your host:
#   home-manager switch --flake .#mac          # macOS (Apple Silicon)
#   home-manager switch --flake .#workstation  # Linux (x86_64)
#
# The first build (or `nix flake lock`) generates ./flake.lock, which pins
# the exact nixpkgs and home-manager revisions.
{
  description = "Home Manager configuration of ogre";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # home-manager follows our nixpkgs so that the whole configuration
    # evaluates against a single, consistent package set.
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # QML language server; follows our nixpkgs so the whole configuration
    # evaluates against a single, consistent package set. Only used on
    # Linux (see home.nix), never evaluated on macOS.
    qml-language-server = {
      url = "github:cushycush/qml-language-server";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    qml-language-server,
    ...
  }: let
    mkConfig = system:
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [./home.nix];
        # Expose flake inputs to the module arguments of home.nix.
        extraSpecialArgs = {
          inherit qml-language-server;
        };
      };
  in {
    homeConfigurations = {
      mac = mkConfig "aarch64-darwin";
      workstation = mkConfig "x86_64-linux";
    };
  };
}
