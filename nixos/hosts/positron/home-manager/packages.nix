{pkgs, ...}: {
  home.packages = with pkgs; [
    adwaita-icon-theme
    # apptainer
    arduino-ide
    audacity
    calibre
    discord
    fldigi
    flrig
    inkscape
    iw
    kdePackages.kate
    kdePackages.kdialog
    libreoffice
    lm_sensors
    lshw
    mgba
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
    openscad
    pcsc-tools
    remmina
    solaar
    usbutils
    vscode-fhs
    wavemon
    wsjtx
  ];

  fonts.fontconfig.enable = true;
}
