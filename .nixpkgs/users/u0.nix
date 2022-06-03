{ pkgs, ... }: {

  home = {
    file = import ../pkgs/home-files.nix;

    packages = with pkgs; [
      ffmpeg
      gnused
      htop
      imagemagick
      libheif
      micro
      mpd
      ncmpcpp
      p7zip
      pass
      youtube-dl
    ];


    sessionPath = [
      "$HOME/.nix-profile/bin"
      "$HOME/Library/Android/sdk/platform-tools/"
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
