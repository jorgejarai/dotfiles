{
  imports = [
    ./programs

    ./packages.nix
    ./rcfiles.nix
  ];

  home.username = "jorge";
  home.homeDirectory = "/home/jorge";

  home.stateVersion = "25.11";

  home.sessionPath = [
    "$HOME/.local/bin"
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
