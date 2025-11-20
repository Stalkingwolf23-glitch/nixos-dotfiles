{
  pkgs,
  inputs,
  userSettings,
  ...
}:

{
  home.packages = with pkgs; [
    inputs.noctalia.packages.${system}.default
  ];

  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;

    colors = {
      mError = "#f38ba8";
      mOError = "#11111b";
      mOnPrimary = "#11111b";
      mOnSecondary = "#11111b";
      mOnSurface = "#cdd6f4";
      mOnSurfaceVariant = "#a3b4eb";
      mOnTertiary = "#11111b";
      mOutline = "#313244";
      mPrimary = "#89b4fa";
      mSecondary = "#b4befe";
      mShadow = "#11111b";
      mSurface = "#1e1e2e";
      mSurfaceVariant = "#181825";
      mTertiary = "#94e2d5";
    };
    settings = {
      appLauncher = {
        backgroundOpacity = 0.85;
        enableClipboardHistory = true;
        pinnedExecs = [

        ];
        position = "center";
        sortByMostUsed = true;
        terminalCommand = "foot -e";
        useApp2Unit = true;
      };
      bar = {
        backgroundOpacity = 0.85;
        density = "comfortable";
        floating = false;
        marginHorizontal = 0.25;
        marginVertical = 0.16;
        monitors = [
          "DP-3"
        ];
        position = "top";
        showCapsule = false;
        widgets = {
          center = [
            {
              id = "SystemMonitor";
              showCpuTemp = true;
              showCpuUsage = true;
              showDiskUsage = false;
              showMemoryAsPercent = false;
              showMemoryUsage = false;
              showNetworkStats = false;
            }
            {
              customFont = "Moralerspace Neon";
              formatHorizontal = "HH:mm";
              formatVertical = "HH:mm";
              id = "Clock";
              useCustomFont = false;
              usePrimaryColor = true;
            }
            {
              id = "SystemMonitor";
              showCpuTemp = false;
              showCpuUsage = false;
              showDiskUsage = true;
              showMemoryAsPercent = true;
              showMemoryUsage = true;
              showNetworkStats = false;
            }
          ];
          left = [
            {
              customIconPath = "";
              icon = "";
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              hideUnoccupied = true;
              id = "Workspace";
              labelMode = "none";
            }
          ];
          right = [
            {
              colorName = "primary";
              hideWhenIdle = true;
              id = "AudioVisualizer";
              width = 100;
            }
            {
              hideMode = "transparent";
              id = "MediaMini";
              scrollingMode = "hover";
              showAlbumArt = false;
              showVisualizer = false;
              showArtistFirst = false;
            }
            {
              displayMode = "onhover";
              id = "Volume";
            }
            {
              displayMode = "onhover";
              id = "Microphone";
            }
            {
              blacklist = [
                "nm-applet"
              ];
              colorizeIcons = true;
              id = "Tray";
            }
          ];
        };
      };
      battery = {
        chargingMode = 0;
      };
      brightness = {
        brightnessStep = 5;
      };
      colorSchemes = {
        darkMode = true;
        generateTemplatesForPredefined = false;
        matugenSchemeType = "scheme-content";
        predefinedScheme = "Catppuccin";
        useWallpaperColors = false;
      };
      controlCenter = {
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = false;
            id = "audio-card";
          }
          {
            enabled = false;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
        ];
        position = "close_to_bar_button";
      };
      general = {
        animationDisabled = false;
        animationSpeed = 1;
        avatarImage = "/home/stalkingwolf/.face";
        compactLockScreen = false;
        dimDesktop = false;
        forceBlackScreenCorners = false;
        radiusRatio = 1;
        scaleRatio = 1.1;
        screenRadiusRatio = 1;
        showScreenCorners = true;
      };
      location = {
        name = "Singapore";
        showWeekNumberInCalendar = false;
        use12hourFormat = false;
        useFahrenheit = false;
        weatherEnabled = true;
        analogClockInCalendar = true;
      };
      network = {
        wifiEnabled = true;
      };
      sessionMenu = {
        enableCountdown = false;
        position = "center";
        powerOptions = [
          {
            action = "lock";
            enabled = true;
          }
          {
            action = "suspend";
            enabled = true;
          }
          {
            action = "hibernate";
            enabled = false;
          }
          {
            action = "reboot";
            enabled = true;
          }
          {
            action = "logout";
            enabled = true;
          }
          {
            action = "shutdown";
            enabled = true;
          }
        ];
      };
      notifications = {
        alwaysOnTop = false;
        criticalUrgencyDuration = 15;
        doNotDisturb = false;
        lastSeenTs = 0;
        location = "top_right";
        lowUrgencyDuration = 3;
        monitors = [
          "DP-3"
        ];
        normalUrgencyDuration = 8;
        respectExpireTimeout = false;
      };
      osd = {
        alwaysOnTop = true;
        autoHideMs = 2000;
        enabled = true;
        location = "bottom";
        monitors = [
          "DP-3"
        ];
      };
      dock = {
        enabled = false;
      };
      setupCompleted = true;
      ui = {
        fontDefault = "Moralerspace Argon";
        fontDefaultScale = 1.2;
        fontFixed = "Material Design Icons";
        fontFixedScale = 1.1;
        idleInhibitorEnabled = false;
        tooltipsEnabled = true;
      };
      wallpaper = {
        defaultWallpaper = "/home/${userSettings.username}/Pictures/Wallpaper/error-wallpaper-mocha-blue.png";
        directory = "/home/${userSettings.username}/Pictures/Wallpaper";
        enableMultiMonitorDirectories = false;
        enabled = true;
        fillColor = "#1e1e2e";
        fillMode = "crop";
        monitors = [
          "DP-3"
          "HDMI-A-3"
        ];
        randomEnabled = true;
        randomIntervalSec = 900;
        setWallpaperOnAllMonitors = false;
        transitionDuration = 1500;
        transitionEdgeSmoothness = 0.05;
        transitionType = "random";
      };
    };
  };
}
