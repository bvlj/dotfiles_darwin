{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-25.05-darwin";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, ... }: {
    darwinConfigurations.hyperbolic-hare = nix-darwin.lib.darwinSystem {
      modules = [
        ./modules/nix-core.nix
        ./modules/host.nix
        ./modules/system.nix

        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs    = false;
          home-manager.useUserPackages  = true;
          home-manager.extraSpecialArgs = inputs;
          home-manager.users.joey       = import ./home/user-joey.nix;
        }
      ];
      system = "aarch64-darwin";
    };
  };
}
