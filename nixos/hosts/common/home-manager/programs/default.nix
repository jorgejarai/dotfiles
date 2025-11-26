{
  imports = [
    ./neovim

    ./eza.nix
    ./git.nix
    ./starship.nix
    ./tmux.nix
    ./zsh.nix
  ];

  programs = {
    home-manager.enable = true;
    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultOptions = [
        "--color=light"
        "--border=rounded"
        "--height=60%"
      ];
      tmux.enableShellIntegration = true;
    };
  };
}
