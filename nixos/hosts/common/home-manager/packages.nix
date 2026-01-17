{pkgs, ...}: {
  home.packages = with pkgs; [
    age
    bat
    chafa
    devenv
    difftastic
    dig
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
    timg
    traceroute
    wl-clipboard
    yt-dlp
  ];
}
