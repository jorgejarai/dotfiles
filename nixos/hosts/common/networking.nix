{
  networking = {
    nameservers = ["192.168.1.16" "1.1.1.1" "1.0.0.1"];
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
  };
}
