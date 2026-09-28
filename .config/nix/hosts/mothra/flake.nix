{
  description = "Mac configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: {
    darwinModules.default = {
      imports = [
        ./configuration.nix
      ];
    };
  };
}