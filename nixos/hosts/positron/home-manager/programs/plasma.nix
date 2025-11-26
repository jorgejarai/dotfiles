{
  programs.plasma = {
    enable = true;
    shortcuts = {
      "services/org.kde.konsole.desktop"."_launch" = [];
      "services/org.wezfurlong.wezterm.desktop"."_launch" = "Ctrl+Alt+T";
    };
    overrideConfig = true;
    kscreenlocker = {
      lockOnResume = true;
      timeout = 15;
    };
    configFile = {
      kcminputrc."Libinput/1739/52861/SYNA32B8:00 06CB:CE7D Touchpad".NaturalScroll = true;
      kcminputrc."Libinput/52861/1739/SYNA32B8:00 06CB:CE7D Touchpad" = {
        "DisableWhileTyping" = true;
        "Enabled" = true;
        "LeftHanded" = false;
        "MiddleButtonEmulation" = true;
        "NaturalScroll" = true;
        "PointerAcceleration" = 0;
        "TapToClick" = true;
      };
      plasma-localerc.Formats = {
        "LANG" = "en_US.UTF-8";
        "LC_ADDRESS" = "es_CL.UTF-8";
        "LC_MEASUREMENT" = "es_CL.UTF-8";
        "LC_MONETARY" = "es_CL.UTF-8";
        "LC_NAME" = "es_CL.UTF-8";
        "LC_NUMERIC" = "es_CL.UTF-8";
        "LC_PAPER" = "es_CL.UTF-8";
        "LC_TELEPHONE" = "es_CL.UTF-8";
        "LC_TIME" = "C";
      };
    };
    powerdevil = {
      AC = {
        autoSuspend = {
          action = "nothing";
        };
        dimDisplay.enable = false;
        powerButtonAction = "nothing";
        powerProfile = "performance";
        whenLaptopLidClosed = "doNothing";
      };
      battery = {
        autoSuspend = {
          action = "sleep";
          idleTimeout = 600;
        };
        dimDisplay = {
          enable = true;
          idleTimeout = 300;
        };
        powerButtonAction = "nothing";
        powerProfile = "powerSaving";
        whenLaptopLidClosed = "sleep";
      };
      lowBattery = {
        autoSuspend = {
          action = "sleep";
          idleTimeout = 600;
        };
        dimDisplay = {
          enable = true;
          idleTimeout = 300;
        };
        powerButtonAction = "nothing";
        powerProfile = "powerSaving";
        whenLaptopLidClosed = "sleep";
      };
    };
  };

  services.kdeconnect.enable = true;
}
