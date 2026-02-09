{ pkgs, lib, platform, ... }:
{
  nix = {
    package = pkgs.nix;

    # Weekly auto GC
    gc = {
      automatic = true;
      options   = "--delete-older-than 7d";
    };

    settings = {
        # https://github.com/NixOS/nix/issues/7273
        auto-optimise-store   = false;
        experimental-features = [ "nix-command" "flakes" ];
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = platform;
  };

  programs.nix-index.enable = true;
}
