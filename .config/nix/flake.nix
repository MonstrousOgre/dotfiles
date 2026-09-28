{
  description = "My NixOS and nix-darwin configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";

    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "path:./modules/hyprland";

    common.url = "path:./modules/common";

    gojira = {
      url = "path:./hosts/gojira";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mothra = {
      url = "path:./hosts/mothra";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nix-darwin,
    gojira,
    mothra,
    hyprland,
    common,
    ...
  }: {
    nixosConfigurations.gojira = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        gojira.nixosModules.default
        hyprland.nixosModules.default
        common.nixosModules.default
      ];
    };

    darwinConfigurations.mothra = nix-darwin.lib.darwinSystem {
      modules = [
        mothra.darwinModules.default
        common.darwinModules.default

        {
          system.configurationRevision =
            self.rev or self.dirtyRev or null;
        }
      ];
    };
  };
}
