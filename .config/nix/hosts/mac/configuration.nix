{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vim
    lazygit
  ];

  nix.settings.experimental-features = "nix-command flakes";

  system.stateVersion = 6;

  nixpkgs.hostPlatform = "aarch64-darwin";

  programs.zsh.enable = true;

  users.users.ogre.shell = pkgs.zsh;
}
