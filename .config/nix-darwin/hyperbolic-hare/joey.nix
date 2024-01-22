{ pkgs, ... }:
let
  username = "joey";
in {
  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    file = import ../pkgs/home-files.nix;

    packages = with pkgs; [
      android-tools
      bash
      bazelisk
      ffmpeg-full
      gawk
      git-repo
      gnused
      gnutar
      htop
      imagemagick
      jq
      libheif
      micro
      nodejs_20
      p7zip
      python310
      ripgrep
      rsync
      sqlite
    ];

    sessionPath = [
      "/run/current-system/sw/bin"
      "/etc/profiles/per-user/joey/bin"
      "/usr/local/bin"
      "$HOME/.config/sh/scripts"
    ];

    sessionVariables = {
      EDITOR = "micro";

      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";

      CUDA_CACHE_PATH = "$XDG_CACHE_HOME/nv";
      DOCKER_CONFIG = "$XDG_CONFIG_HOME/docker";
      GHCUP_USE_XDG_DIRS = "true";
      GRADLE_USER_HOME = "$XDG_DATA_HOME/gradle";
      LESSHISTFILE = "$XDG_STATE_HOME/less/history";
      JAVA_HOME = "/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home";
      NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc";
      SQLITE_HISTORY = "$XDG_CACHE_HOME/sqlite_history";
      STACK_ROOT = "$XDG_DATA_HOME/stack";
    };

    stateVersion = "23.11";
  };

  programs = {
    git = import ../pkgs/git.nix;
    zsh = import ../pkgs/zsh.nix pkgs;

    home-manager = { enable = true; };
  };
}
