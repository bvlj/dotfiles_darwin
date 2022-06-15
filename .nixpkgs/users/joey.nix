{ pkgs, ... }: {
  home = {
    file = import ../pkgs/home-files.nix;

    packages = with pkgs; [
      gnused
      htop
      micro
      nodejs-16_x
      p7zip
      texlab
      texlive.combined.scheme-full
    ];

    sessionPath = [
      "/run/current-system/sw/bin"
      "/usr/local/bin"
      "$HOME/.nix-profile/bin"
      "$HOME/.config/sh/scripts"
    ];

    sessionVariables = {
      ANDROID_HOME = "$HOME/Library/Android/sdk";
      EDITOR = "micro";
      JAVA_HOME = "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home";
      NIX_PATH = "darwin-config=$HOME/.nixpkgs/darwin-configuration.nix:/nix/var/nix/profiles/per-user/root/channels:$HOME/.nix-defexpr/channels";
    };
  };

  programs = {
    git = import ../pkgs/git.nix;
    zsh = import ../pkgs/zsh.nix pkgs;
  };
}
