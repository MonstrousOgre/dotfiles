{
  description = "My NixOS and nix-darwin configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";

    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "path:./modules/hyprland";

    common.url = "path:./modules/common";

    workstation = {
      url = "path:./hosts/workstation";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprland.follows = "hyprland";
    };

    mac = {
      url = "path:./hosts/mac";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nix-darwin,
    workstation,
    mac,
    hyprland,
    common,
    ...
  }: {
    nixosConfigurations.workstation = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        workstation.nixosModules.default
        hyprland.nixosModules.default
        common.nixosModules.default
      ];
    };

    darwinConfigurations."Kashs-MacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [
        mac.darwinModules.default
        common.darwinModules.default

        {
          system.configurationRevision =
            self.rev or self.dirtyRev or null;
        }
      ];
    };
  };
}
