{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./emacs.nix
    ./plasma.nix
    ./ssh.nix
  ];

  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox.override {
        extraPrefsFiles = [
          (pkgs.writeText "good-girl.cfg" (builtins.readFile ../../dotfiles/firefox/good-girl.cfg))
        ];
        # Required: good-girl.cfg uses privileged Services.obs/Services.prefs APIs.
        extraAutoConfig = ''
          pref("general.config.sandbox_enabled", false);
        '';
      };
      nativeMessagingHosts = [
        pkgs.passff-host
      ];
      configPath = "${config.xdg.configHome}/mozilla/firefox";
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
