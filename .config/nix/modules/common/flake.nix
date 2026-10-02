{
  description = "Modules common to all my configurations";

  inputs = {
    nix-pandoc-bin.url = "github:doronbehar/nix-pandoc-bin";
  };

  outputs = {
    self,
    nix-pandoc-bin,
    ...
  }: let
    module = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        wget
        neovim
        lazygit
        nix-pandoc-bin.packages."${pkgs.stdenv.hostPlatform.system}".default
        typst
      ];
    };
  in {
    nixosModules.default = module;
    darwinModules.default = module;
  };
}
