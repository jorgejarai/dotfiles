{pkgs, ...}: {
  home.packages = with pkgs; [
    adwaita-icon-theme
    audacity
    ccid
    discord
    fldigi
    flrig
    inkscape
    iw
    kdePackages.kate
    libreoffice
    microsoft-edge
    mpv
    naps2
    nerd-fonts.blex-mono
    nerd-fonts.code-new-roman
    nerd-fonts.fira-mono
    nerd-fonts.im-writing
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto
    nerd-fonts.symbols-only
    obsidian
    pcsc-tools
    remmina
    solaar
    vscode
    wavemon
    wl-clipboard
    wsjtx
  ];

  fonts.fontconfig.enable = true;
}
