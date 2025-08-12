{ lib, pkgs, ... }:
let
  username = "joey";
in {
  home = {
    username      = username;
    homeDirectory = "/Users/${username}";

    activation = {
      removeExistingGitconfig = lib.hm.dag.entryBefore [ "checkLinkTargets" ] "rm -f $HOME/.gitconfig";
      # activateSettings -u will reload the settings from the database and apply
      # them to the current session, so we do not need to logout and login again
      # to make the changes take effect.
      activateSettings = lib.hm.dag.entryAfter [ "writeBoundary" ] "/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u";
    };

    file = import ./home-files.nix;

    packages = with pkgs; [
      android-tools
      bazelisk
      bazel-buildtools
      ffmpeg-full
      gawk
      ghc
      gnupg
      gnused
      gnutar
      imagemagick
      libheif
      nodejs_22
      p7zip
      python313
      rsync
      shellcheck
      sqlite-interactive
      texliveSmall
      zotero
    ];

    sessionPath = [
      "$HOME/.local/bin"
    ];

    sessionVariables = {
      XDG_CACHE_HOME  = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME   = "$HOME/.local/share";
      XDG_STATE_HOME  = "$HOME/.local/state";

      GHCUP_USE_XDG_DIRS    = "true";
      GRADLE_USER_HOME      = "$HOME/.local/share/gradle";
      LESSHISTFILE          = "$HOME/.local/state/less/history";
      NPM_CONFIG_USERCONFIG = "$HOME/.config/npm/npmrc";
      SQLITE_HISTORY        = "$HOME/.cache/sqlite_history";
    };

    stateVersion = "25.05";
  };

  programs = {
    bash         = import ../pkgs/bash.nix;
    git          = import ../pkgs/git.nix;
    home-manager = import ../pkgs/home-manager.nix;
    htop         = import ../pkgs/htop.nix;
    mpv          = import ../pkgs/mpv.nix;
    java         = import ../pkgs/java.nix pkgs;
    ripgrep      = import ../pkgs/ripgrep.nix;
    ssh          = import ../pkgs/ssh.nix;
    vim          = import ../pkgs/vim.nix pkgs;
    vscode       = import ../pkgs/vscode.nix pkgs;
    yazi         = import ../pkgs/yazi.nix;
    zsh          = import ../pkgs/zsh.nix pkgs;
  };
}
