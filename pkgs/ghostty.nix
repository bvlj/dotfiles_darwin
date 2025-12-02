{
  enable = true;

  # Broken package on darwin
  package        = null;
  systemd.enable = false;

  settings = {
    # Clipboard
    clipboard-paste-bracketed-safe   = true;
    clipboard-trim-trailing-spaces   = true;
    copy-on-select                   = false;
    # Cursor
    cursor-style                     = "block";
    mouse-hide-while-typing          = true;
    # Font
    adjust-cell-height               = 1;
    bold-is-bright                   = true;
    font-family                      = "Iosevka Term SS14";
    font-feature                     = "-calt, -liga, -dlig";
    font-size                        = 12;
    # Shell
    shell-integration                = "zsh";
    shell-integration-features       = "no-cursor, no-title";
    # UI
    macos-option-as-alt              = true;
    macos-titlebar-proxy-icon        = "hidden";
    resize-overlay                   = "never";
    theme                            = "user-theme";
    # Window
    window-colorspace                = "display-p3";
    window-inherit-working-directory = true;
    window-padding-x                 = 8;
    window-padding-y                 = 8;
    window-theme                     = "auto";
    # Updates
    auto-update                      = "check";
    auto-update-channel              = "stable";
  };

  themes = {
    user-theme = {
      background           = "120d12";
      foreground           = "e8dace";
      cursor-color         = "e8dace";
      selection-background = "fbecdf";
      selection-foreground = "120d12";
      palette              = [
        "0=#120d12"
        "1=#9d6960"
        "2=#c7745d"
        "3=#d69d70"
        "4=#caa775"
        "5=#6e6691"
        "6=#edd098"
        "7=#e8dace"
        "8=#a19890"
        "9=#cd8978"
        "10=#ee866a"
        "11=#f3b47e"
        "12=#f6c89a"
        "13=#958bc2"
        "14=#f8da9e"
        "15=#fbecdf"
      ];
    };
  };
}
