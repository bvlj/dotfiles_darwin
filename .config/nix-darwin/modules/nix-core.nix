{ pkgs, lib, ... }:
{
  nix = {
    package = pkgs.nix;

    # Weekly auto GC
    gc = {
      automatic = lib.mkDefault true;
      options = lib.mkDefault "--delete-older-than 7d";
    };

    settings = {
        experimental-features = [ "nix-command" "flakes" ];
        # https://github.com/NixOS/nix/issues/7273
        auto-optimise-store = false;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Auto upgrade
  services.nix-daemon.enable = true;

  programs.nix-index.enable = true;
}