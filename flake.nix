{
  description = "a test home-manager flake";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  inputs.home-manager = {
    url = "github:rycee/home-manager/master";
    inputs.nixpkgs.follows = "/nixpkgs";
  };

  outputs = { home-manager, nixpkgs, ... }: {
    defaultPackage.x86_64-linux = 
      let
        # home-manager exports this in the flake. These are the basic args to generate
        # a configuration. This method wraps up the creation with some basic arguments
        cfg = home-manager.lib.homeManagerConfiguration {
          # This is the the actual home-manager configuration module (home.nix normally)
          configuration = import ./home.nix;
          # I think this is the current system
          # TODO: Determine how to automatically determine this and simplify via flake-utils
          system = "x86_64-linux";
          # The user's home directory
          homeDirectory = "/home/jabucher";
          # The user's username
          username = "jabucher";
          # These are the packages from nixpkgs that nixpkgs exports
          pkgs = nixpkgs.outputs.legacyPackages.x86_64-linux;
        };
      in cfg.activationPackage;
  };
}
