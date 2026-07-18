{
  config,
  lib,
  ...
}: {
  imports = [
    ../common/networking.nix
  ];

  networking = {
    hostName = "positron";
    networkmanager.enable = true;
    nftables.enable = true;

    firewall = {
      trustedInterfaces = [config.services.tailscale.interfaceName];

      allowedTCPPorts = [
        22
      ];
      allowedUDPPorts = [config.services.tailscale.port];

      allowedTCPPortRanges = [
        {
          from = 1714; # KDE Connect
          to = 1764;
        }
        {
          from = 8000; # Local development
          to = 8010;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 1714; # KDE Connect
          to = 1764;
        }
      ];
    };
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.tailscale.enable = true;

  systemd.services.tailscaled.serviceConfig.Environment = [
    "TS_DEBUG_FIREWALL_MODE=nftables"
  ];
}
