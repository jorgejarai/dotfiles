{pkgs, ...}: {
  home.packages = with pkgs; [
    age
    bat
    chafa
    devenv
    difftastic
    fastfetch
    fd
    file
    inotify-tools
    iperf3
    lazygit
    lynx
    nmap
    openssl
    pass
    ripgrep
    screen
    sops
    traceroute
    wl-clipboard
    yt-dlp
  ];
}
