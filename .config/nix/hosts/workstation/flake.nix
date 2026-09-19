{
  description = "Workstation configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    hyprland = {
          url = "/home/ogre/.config/nix/modules/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, hyprland, ... }: {
    nixosModules.default = {
      imports = [
        ./configuration.nix
        hyprland.nixosModules.default
      ];
    };
  };
}

