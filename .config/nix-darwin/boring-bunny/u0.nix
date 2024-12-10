{ lib, pkgs, ... }:
let
  username = "u0";
in {
  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    activation = {
      removeExistingGitconfig = lib.hm.dag.entryBefore [ "checkLinkTargets" ] "rm -f $HOME/.gitconfig";
    };

    file = import ../pkgs/home-files.nix;

    packages = with pkgs; [
      bashInteractive
      ffmpeg-full
      gawk
      gnupg
      gnused
      gnutar
      htop
      imagemagick
      jq
      libheif
      nodejs_20
      p7zip
      python312
      ripgrep
      rsync
      shellcheck
      sqlite
    ];

    sessionPath = [
      "/run/current-system/sw/bin"
      "/etc/profiles/per-user/u0/bin"
      "/usr/local/bin"
      "$HOME/.local/bin"
      "$HOME/Library/Android/sdk/platform-tools/"
    ];

    sessionVariables = {
      XDG_CACHE_HOME  = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME   = "$HOME/.local/share";
      XDG_STATE_HOME  = "$HOME/.local/state";

      ANDROID_HOME          = "$HOME/Library/Android/sdk";
      GRADLE_USER_HOME      = "$HOME/.local/share/gradle";
      LESSHISTFILE          = "$HOME/.local/state/less/history";
      JAVA_HOME             = "/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home";
      NPM_CONFIG_USERCONFIG = "$HOME/.config/npm/npmrc";
      SQLITE_HISTORY        = "$HOME/.cache/sqlite_history";
    };

    stateVersion = "24.11";
  };

  programs = {
    git = import ../pkgs/git.nix;
    zsh = import ../pkgs/zsh.nix pkgs;
    vim    = import ../pkgs/vim.nix pkgs;

    home-manager = { enable = true; };
  };
}
