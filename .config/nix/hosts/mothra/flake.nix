{
  description = "Mac configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
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
