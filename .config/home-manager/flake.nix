# Home Manager configuration managed as a Nix flake.
#
# Apply it with:
#   home-manager switch --flake /home/ogre/.config/home-manager
# or from this directory:
#   home-manager switch --flake .
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
    # evaluates against a single, consistent package set.
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
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations.ogre = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [./home.nix];
      # Expose flake inputs to the module arguments of home.nix.
      extraSpecialArgs = {
        inherit qml-language-server;
      };
    };
  };
}
