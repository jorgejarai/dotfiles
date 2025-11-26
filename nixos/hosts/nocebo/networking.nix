{
  networking = {
    hostName = "nocebo";

    firewall = {
      allowedTCPPorts = [2222];
      allowedUDPPorts = [];
    };
  };
}
