{ config, pkgs, ... }:

let 
  USER = builtins.getEnv "USER";
in
{
  imports = [
    <home-manager/nix-darwin>
  ];

  home-manager = {
    users.${USER}.imports = [ ./users/${USER}.nix ];
  };

  nix = {
    package = pkgs.nix;
    readOnlyStore = true;
  };

  services = {
    nix-daemon = {
      enable = true;
    };
  };

  system = {
    defaults = {
      NSGlobalDomain = {
        AppleEnableSwipeNavigateWithScrolls = true;
        AppleInterfaceStyleSwitchesAutomatically = true;
        AppleMeasurementUnits = "Centimeters";
        AppleMetricUnits = 1;
        AppleShowAllExtensions = true;
        AppleShowScrollBars = "WhenScrolling";
        AppleTemperatureUnit = "Celsius";
        InitialKeyRepeat = 35;
        KeyRepeat = 2;
        NSDocumentSaveNewDocumentsToCloud = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
      };

      SoftwareUpdate = {
        AutomaticallyInstallMacOSUpdates = false;
      };

      dock = {
        autohide = true;
        autohide-delay = "1000.0";
        minimize-to-application = true;
        mru-spaces = false;
        orientation = "bottom";
        show-process-indicators = true;
        show-recents = true;
        static-only = false;
      };

      finder = {
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        FXDefaultSearchScope = "SCcf";
        FXPreferredViewStyle = "Nlsv";
        _FXShowPosixPathInTitle = true;
      };

      loginwindow = {
        GuestEnabled = false;
        SHOWFULLNAME = true;
      };

      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
      };
    };

    stateVersion = 4;
  };

  users = {
    users = {
      ${USER} = {
        name = "${USER}";
        home = "/Users/${USER}";
      };
    };
  };
}
