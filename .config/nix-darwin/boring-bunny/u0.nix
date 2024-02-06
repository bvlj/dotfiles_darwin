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
      bash
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
      "/etc/profiles/per-user/u0/bin"
      "/usr/local/bin"
      "$HOME/.config/sh/scripts"
      "$HOME/Library/Android/sdk/platform-tools/"
    ];

    sessionVariables = {
      EDITOR = "micro";

      ANDROID_HOME = "$HOME/Library/Android/sdk";
      GHCUP_USE_XDG_DIRS = "true";
      GRADLE_USER_HOME = "$HOME/.local/share/gradle";
      LESSHISTFILE = "$HOME/.local/state/less/history";
      JAVA_HOME = "/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home";
      NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc";
      SQLITE_HISTORY = "$HOME/.cache/sqlite_history";
      STACK_ROOT = "$HOME/.local/share/stack";
    };

    stateVersion = "23.11";
  };

  programs = {
    git = import ../pkgs/git.nix;
    zsh = import ../pkgs/zsh.nix pkgs;

    home-manager = { enable = true; };
  };
}
