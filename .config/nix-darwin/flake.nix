{
  description = "Darwin System";

  inputs = {
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";

    darwin = {
      url = "github:lnl7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
  };

  outputs = inputs@{ self, nixpkgs, darwin, home-manager, ... }: {
    darwinConfigurations.boring-bunny = darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      modules = [
        ./modules/nix-core.nix
        ./modules/system.nix
        ./boring-bunny/host-users.nix
        
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = false;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = inputs;
          home-manager.users.u0 = import ./boring-bunny/u0.nix;
        }
      ];
    };

    darwinConfigurations.hyperbolic-hare = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./modules/nix-core.nix
        ./modules/system.nix
        ./hyperbolic-hare/host-users.nix
        
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = false;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = inputs;
          home-manager.users.joey = import ./hyperbolic-hare/joey.nix;
        }
      ];
    };
  };
}
