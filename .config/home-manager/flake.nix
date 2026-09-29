# Home Manager configuration managed as a Nix flake.
#
# Apply it from this directory with the entry matching your host:
#   home-manager switch --flake .#mothra  # macOS (Apple Silicon)
#   home-manager switch --flake .#gojira  # Linux (x86_64)
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
    # Linux (see gojira.nix), never evaluated on macOS.
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
    mkConfig = system: hostModule:
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        # Each host file imports ./common.nix itself.
        modules = [hostModule];
        # Expose flake inputs to the module arguments (used by gojira.nix).
        extraSpecialArgs = {
          inherit qml-language-server;
        };
      };
  in {
    homeConfigurations = {
      mothra = mkConfig "aarch64-darwin" ./mothra.nix;
      gojira = mkConfig "x86_64-linux" ./gojira.nix;
    };
  };
}
