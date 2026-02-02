{pkgs, ...}: {
  system.stateVersion = "25.11";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  time.timeZone = "America/Santiago";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocales = ["es_CL.UTF-8/UTF-8"];
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CL.UTF-8";
    LC_IDENTIFICATION = "es_CL.UTF-8";
    LC_MEASUREMENT = "es_CL.UTF-8";
    LC_MONETARY = "es_CL.UTF-8";
    LC_NAME = "es_CL.UTF-8";
    LC_NUMERIC = "es_CL.UTF-8";
    LC_PAPER = "es_CL.UTF-8";
    LC_TELEPHONE = "es_CL.UTF-8";
    LC_TIME = "C.UTF-8";
  };

  # Common system packages shared across all hosts
  environment.systemPackages = with pkgs; [
    alejandra
    htop
    man-pages
    man-pages-posix
    neovim
    tmux
    wget
    zsh
  ];
  environment.pathsToLink = ["/share/zsh"];

  nix.settings.trusted-users = ["root" "jorge"];
}
