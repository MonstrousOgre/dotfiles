{
  description = "Modules common to all my configurations";

  outputs = {self, ...}: let
    module = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        wget
        neovim
        lazygit
      ];
    };
  in {
    nixosModules.default = module;
    darwinModules.default = module;
  };
}
