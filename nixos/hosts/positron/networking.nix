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

    firewall = {
      allowedTCPPorts = [
        22
      ];
      allowedUDPPorts = [
      ];

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

  sops.secrets."zerotier/primary_id" = {};
  sops.templates."zerotier-network".content = ''
    ${config.sops.placeholder."zerotier/primary_id"}
  '';

  services.zerotierone = {
    enable = true;

    localConf = {
      physical = {
        "10.0.0.0/24".blacklist = true;
      };
    };
  };

  systemd.services.zerotierone.postStart = lib.mkAfter ''
    network_id=$(cat ${config.sops.templates."zerotier-network".path})
    sleep 3
    ${config.services.zerotierone.package}/bin/zerotier-cli join "$network_id" || true
  '';
}
