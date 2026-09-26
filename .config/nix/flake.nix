{
  description = "My NixOS and nix-darwin configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";

    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    workstation = {
      url = "path:./hosts/workstation";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mac = {
      url = "path:./hosts/mac";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nix-darwin,
    workstation,
    mac,
    ...
  }: {
    nixosConfigurations.workstation =
      workstation.nixosConfigurations.workstation;

    darwinConfigurations."Kashs-MacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [
        mac.darwinModules.default

        {
          system.configurationRevision =
            self.rev or self.dirtyRev or null;
        }
      ];
    };
  };
}
