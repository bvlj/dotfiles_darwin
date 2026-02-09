{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-25.11-darwin";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, ... }: let
    username = "joey";
    hostname = "hyperbolic-hare";
    platform = "aarch64-darwin";
  in {
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      modules     = [
        ./modules/nix-core.nix
        ./modules/host.nix
        ./modules/system.nix

        home-manager.darwinModules.home-manager {
          home-manager = {
            useGlobalPkgs       = false;
            useUserPackages     = true;
            extraSpecialArgs    = { inherit inputs username hostname; };
            users."${username}" = import ./home/user.nix;
          };
        }
      ];
      specialArgs = { inherit inputs self username hostname platform; };
      system      = platform;
    };
  };
}
