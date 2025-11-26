{pkgs, ...}: {
  imports = [
    ../common/configuration.nix

    ./networking.nix
    ./programs.nix
    ./wsl.nix
  ];

  users.users.jorge = {
    isNormalUser = true;
    description = "Jorge Jara";
    extraGroups = ["wheel" "scanner" "lp"];
    shell = pkgs.zsh;
  };

  services.openssh = {
    enable = true;
    ports = [2222];
    settings = {
      AllowTcpForwarding = true;
      AllowUsers = ["jorge"];
      ChallengeResponseAuthentication = false;
      KbdInteractiveAuthentication = false;
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      PubkeyAuthentication = true;
      StreamLocalBindUnlink = true;
      UseDns = true;
      UsePAM = true;
      X11Forwarding = true;
    };
  };

  environment.systemPackages = with pkgs; [
  ];

  home-manager.users.jorge = import ./home-manager;
}
