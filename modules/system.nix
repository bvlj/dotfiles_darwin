{ pkgs, ... }:
{
  launchd = {
    user.agents.homeTmpCleanup = {
      script = ''
        touch /tmp/home-tmp-cleanup.txt;
        find "$HOME/tmp" -mindepth 1 -mtime +2 -delete;
        '';
      serviceConfig = {
        Label                 = "homeTmpCleanup";
        ProcessType           = "Background";
        StartCalendarInterval = { Hour = 10; };
      };
    };
  };

  networking = {
    applicationFirewall = {
      enable            = true;
      allowSigned       = false;
      allowSignedApp    = false;
      enableStealthMode = false;
    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  services = {
    tailscale = {
      enable = true;
    };
  };

  system = {
    # Link JDK to /Library/Java/JavaVirtualMachines
    activationScripts.postActivation.text = ''
      ln -sf "${pkgs.temurin-bin}/Library/Java/JavaVirtualMachines/temurin-21.jdk" "/Library/Java/JavaVirtualMachines/"
      '';

    defaults = {
      NSGlobalDomain = {
        _HIHideMenuBar                           = false;
        "com.apple.keyboard.fnState"             = true;
        AppleEnableSwipeNavigateWithScrolls      = true;
        AppleInterfaceStyleSwitchesAutomatically = true;
        AppleMeasurementUnits                    = "Centimeters";
        AppleMetricUnits                         = 1;
        AppleShowAllExtensions                   = true;
        AppleShowScrollBars                      = "WhenScrolling";
        AppleTemperatureUnit                     = "Celsius";
        AppleWindowTabbingMode                   = "always";
        InitialKeyRepeat                         = 35;
        KeyRepeat                                = 2;
        NSDocumentSaveNewDocumentsToCloud        = false;
        NSNavPanelExpandedStateForSaveMode       = true;
        NSNavPanelExpandedStateForSaveMode2      = true;
      };

      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;

      WindowManager = {
        GloballyEnabled                  = false;
        EnableStandardClickToShowDesktop = false;
        EnableTiledWindowMargins         = true;
        EnableTilingByEdgeDrag           = true;
        EnableTilingOptionAccelerator    = true;
        EnableTopTilingByEdgeDrag        = true;
        StandardHideDesktopIcons         = false;
        StandardHideWidgets              = true;
      };

      controlcenter = {
        AirDrop               = false;
        BatteryShowPercentage = true;
        Bluetooth             = false;
        Display               = false;
        NowPlaying            = false;
        Sound                 = false;
      };

      dock = {
        autohide                         = true;
        autohide-delay                   = 1000.0;
        expose-group-apps                = false;
        minimize-to-application          = true;
        mru-spaces                       = false;
        orientation                      = "bottom";
        show-process-indicators          = true;
        show-recents                     = true;
        static-only                      = false;
        showAppExposeGestureEnabled      = false;
        showDesktopGestureEnabled        = false;
        showLaunchpadGestureEnabled      = true;
        showMissionControlGestureEnabled = true;
      };

      finder = {
        _FXShowPosixPathInTitle        = true;
        _FXSortFoldersFirst            = true;
        AppleShowAllExtensions         = true;
        FXDefaultSearchScope           = "SCcf";
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle           = "Nlsv";
        FXRemoveOldTrashItems          = true;
        QuitMenuItem                   = true;
        ShowRemovableMediaOnDesktop    = true;
      };

      loginwindow = {
        GuestEnabled = false;
        SHOWFULLNAME = true;
      };

      menuExtraClock = {
        FlashDateSeparators = false;
        Show24Hour          = true;
      };

      trackpad = {
        ActuateDetents                      = true;
        Clicking                            = true;
        TrackpadRightClick                  = true;
        TrackpadThreeFingerDrag             = true;
        TrackpadFourFingerHorizSwipeGesture = 2;
        TrackpadFourFingerVertSwipeGesture  = 2;
      };
    };

    stateVersion = 6;
  };
}
