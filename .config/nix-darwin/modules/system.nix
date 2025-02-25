{ pkgs, ... }:
{
  launchd = {
    user.agents.homeTmpCleanup = {
      script = "touch /tmp/home-tmp-cleanup.txt; find \"$HOME/tmp\" -mindepth 1 -mtime +2 -delete";
      serviceConfig = {
        Label = "homeTmpCleanup";
        StartInterval = 28800; # 3 times a day
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
        AppleWindowTabbingMode = "always";
        InitialKeyRepeat = 35;
        KeyRepeat = 2;
        NSDocumentSaveNewDocumentsToCloud = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        _HIHideMenuBar = false;
        "com.apple.keyboard.fnState" = true;
      };

      SoftwareUpdate = {
        AutomaticallyInstallMacOSUpdates = false;
      };

      WindowManager = {
        GloballyEnabled = false;
        EnableStandardClickToShowDesktop = false;
        EnableTiledWindowMargins = true;
        EnableTilingByEdgeDrag = true;
        EnableTilingOptionAccelerator = true;
        EnableTopTilingByEdgeDrag = true;
        StandardHideDesktopIcons = false;
        StandardHideWidgets = true;
      };

      controlcenter = {
        AirDrop = false;
        BatteryShowPercentage = true;
        Bluetooth = false;
        Display = false;
        NowPlaying = false;
        Sound = false;
      };

      dock = {
        autohide = true;
        autohide-delay = 1000.0;
        expose-group-apps = false;
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
        FXRemoveOldTrashItems = true;
        QuitMenuItem = true;
        ShowRemovableMediaOnDesktop = true;
      };

      loginwindow = {
        GuestEnabled = false;
        SHOWFULLNAME = true;
      };

      menuExtraClock = {
        FlashDateSeparators = false;
        Show24Hour = true;
      };

      trackpad = {
        Clicking = true;
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = true;
      };
    };

    stateVersion = 5;
  };

  security = {
    # Add ability to used TouchID for sudo authentication
    pam.enableSudoTouchIdAuth = true;
  };
}
