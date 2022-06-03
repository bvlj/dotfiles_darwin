{ pkgs, ... }: {
  home = {
    file = import ../pkgs/home-files.nix;

    packages = with pkgs; [
      gnused
      htop
      micro
      p7zip
      texlive.combined.scheme-full
    ];

    sessionPath = [
      "$HOME/.nix-profile/bin"
      "$HOME/.config/sh/scripts"
    ];

    sessionVariables = {
      ANDROID_HOME = "$HOME/Library/Android/sdk";
      EDITOR = "micro";
      JAVA_HOME = "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home";
    };
  };

  programs = {
    git = import ../pkgs/git.nix;
    zsh = import ../pkgs/zsh.nix pkgs;
  };
}
