{pkgs, ...}: {
  imports = [
    ../common/configuration.nix

    ./filesystem.nix
    ./hardware-configuration.nix
    ./networking.nix
    ./programs.nix
    ./windowing.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.bluetooth.enable = true;
  hardware.logitech.wireless.enable = true;
  hardware.rtl-sdr.enable = true;

  hardware.sane = {
    enable = true;
    extraBackends = [pkgs.sane-airscan];
  };
  services.udev.packages = [pkgs.sane-airscan];
  services.ipp-usb.enable = true;

  virtualisation.docker.enable = true;

  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.jorge = {
    isNormalUser = true;
    description = "Jorge Jara";
    extraGroups = ["networkmanager" "wheel" "dialout" "cdrom" "docker" "wireshark" "scanner" "lp" "plugdev"];
    shell = pkgs.zsh;
  };

  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      AllowUsers = ["jorge"];
      UseDns = true;
      X11Forwarding = true;
      PermitRootLogin = "no";
    };
  };

  services.pcscd.enable = true;

  environment.systemPackages = with pkgs; [
    gparted
    kdePackages.kio-extras
    kdePackages.kio-fuse
    wireshark
    zerotierone
  ];

  documentation.dev.enable = true;

  home-manager.users.jorge = import ./home-manager;

  sops.defaultSopsFile = ../../secrets/positron.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
}
