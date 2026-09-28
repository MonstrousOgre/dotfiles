{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  system.primaryUser = "ogre";

  imports = [
    ./homebrew.nix
  ];

  # Ensure homebrew binaries are added to system $PATH
  environment.systemPath = [
    "/opt/homebrew/bin"
  ];

  environment.systemPackages = with pkgs; [
    lazygit
  ];

  nix.settings.experimental-features = "nix-command flakes";

  system.stateVersion = 6;

  nixpkgs.hostPlatform = "aarch64-darwin";

  programs.zsh.enable = true;

  users.users.ogre.shell = pkgs.zsh;
}
