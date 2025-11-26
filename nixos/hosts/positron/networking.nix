{
  config,
  lib,
  ...
}: {
  networking = {
    hostName = "positron";
    networkmanager.enable = true;

    extraHosts = ''
      192.168.194.10 nocebo.vpn
      192.168.194.24 positron.vpn
      192.168.194.114 electron.vpn
      192.168.194.110 concordia.vpn
      192.168.194.16 truenas.vpn
      192.168.194.248 chacalluta.vpn
      192.168.194.105 neutrino.vpn
      192.168.194.119 jellyfin.vpn
    '';

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
  };

  sops.secrets."zerotier/primary_id" = {};
  sops.templates."zerotier-network".content = ''
    ${config.sops.placeholder."zerotier/primary_id"}
  '';

  services.zerotierone.enable = true;

  systemd.services.zerotierone.postStart = lib.mkAfter ''
    network_id=$(cat ${config.sops.templates."zerotier-network".path})
    sleep 3
    ${config.services.zerotierone.package}/bin/zerotier-cli join "$network_id" || true
  '';
}
