{
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
      options = "compose:ralt";
    };
  };
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.libinput.enable = true;
}
