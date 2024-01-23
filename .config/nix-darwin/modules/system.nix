{ pkgs, ... }:
{
  launchd = {
    user.agents.homeTmpCleanup = {
      script = "find \"$HOME/tmp/\" -mtime +3 -delete";
      serviceConfig = {
        Label = "homeTmpCleanup";
        LowPriorityIO = true;
        ProcessType = "Background";
        StartInterval = 86400; # Daily
      };
    };
  };

  system = {
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

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
        autohide-delay = 1000.0;
        minimize-to-application = true;
        mru-spaces = false;
        orientation = "bottom";
        show-process-indicators = true;
        show-recents = true;
        static-only = false;
      };

      finder = {
        _FXShowPosixPathInTitle = true;
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        FXDefaultSearchScope = "SCcf";
        FXPreferredViewStyle = "Nlsv";
        QuitMenuItem = true;
      };

      loginwindow = {
        GuestEnabled = false;
        SHOWFULLNAME = true;
      };

      menuExtraClock = {
        Show24Hour = true;
      };

      trackpad = {
        Clicking = true;
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = true;
      };
    };
  };

  security = {
    # Add ability to used TouchID for sudo authentication
    pam.enableSudoTouchIdAuth = true;
  };
}
