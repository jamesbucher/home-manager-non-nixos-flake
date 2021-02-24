{ pkgs, ... }:

{
  # NOTE: This forces home -manager to use the correct nixpkgs passed in in the flake
  # See: https://github.com/nix-community/home-manager/blob/master/modules/modules.nix#L223
  home.stateVersion = "20.09";

  # This is just a minimal example of config. It can be any home-manager configuration
  home.packages = [
    pkgs.htop
    pkgs.fortune
  ];
}
