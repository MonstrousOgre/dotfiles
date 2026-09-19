{
  description = "My NixOS and nix-darwin configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";

    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    qtengine = {
      url = "github:kossLAN/qtengine";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nix-darwin,
    ...
  }: {
    nixosConfigurations.workstation = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit inputs;
      };

      modules = [
        ./hosts/workstation/configuration.nix
      ];
    };

    darwinConfigurations."Kashs-MacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [
        ./hosts/mac/configuration.nix

        {
          system.configurationRevision =
            self.rev or self.dirtyRev or null;
        }
      ];
    };
  };
}
