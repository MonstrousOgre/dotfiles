{
  description = "gojira configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    ...
  }: {
    nixosModules.default = {
      _module.args = {
        inherit inputs;
      };

      imports = [
        ./configuration.nix
      ];
    };
  };
}
