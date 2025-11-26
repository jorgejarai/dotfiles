{pkgs, ...}: {
  imports = [
    ./plasma.nix
    ./ssh.nix
  ];

  programs = {
    firefox = {
      enable = true;
      nativeMessagingHosts = [
        pkgs.passff-host
      ];
    };
    wezterm = {
      enable = true;
      enableZshIntegration = true;
      extraConfig = ''
        return {
          color_scheme = 'Gruvbox dark, soft (base16)',
          font = wezterm.font_with_fallback({
            "BlexMono Nerd Font",
          }),
          font_size = 11.0,
        }
      '';
    };
  };
}
