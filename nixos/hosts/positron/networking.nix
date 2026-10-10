{
  config,
  lib,
  ...
}: let
  wifiNetworks = ["home"];
in {
  imports = [
    ../common/networking.nix
  ];

  sops.secrets."network-manager-wifi-env" = {};

  networking = {
    hostName = "positron";
    nftables.enable = true;

    networkmanager = {
      enable = true;
      ensureProfiles = {
        environmentFiles = [config.sops.secrets."network-manager-wifi-env".path];
        profiles = lib.listToAttrs (map (name: {
            inherit name;
            value = {
              connection = {
                id = name;
                type = "wifi";
              };
              wifi = {
                mode = "infrastructure";
                ssid = "$WIFI_SSID_${lib.toUpper name}";
              };
              wifi-security = {
                auth-alg = "open";
                key-mgmt = "wpa-psk";
                psk = "$WIFI_PSK_${lib.toUpper name}";
              };
              ipv4.method = "auto";
              ipv6.method = "auto";
            };
          })
          wifiNetworks);
      };
    };

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
  services.resolved.enable = true;

  systemd.services.tailscaled.serviceConfig.Environment = [
    "TS_DEBUG_FIREWALL_MODE=nftables"
  ];
}
