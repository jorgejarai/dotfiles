{lib, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;
    defaultKeymap = "emacs";

    initContent = let
      zshConfigEarlyInit = lib.mkOrder 500 ''
        ENABLE_CORRECTION="true"
        COMPLETION_WAITING_DOTS="true"
      '';
      zshConfig = lib.mkOrder 1000 ''
        bindkey  "$terminfo[khome]"   beginning-of-line
        bindkey  "$terminfo[kend]"    end-of-line
        bindkey  "$terminfo[kdch1]"   delete-char

        bindkey  "$terminfo[kLFT5]"   backward-word
        bindkey  "$terminfo[kRIT5]"   forward-word
      '';
    in
      lib.mkMerge [zshConfigEarlyInit zshConfig];

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ~/Proyectos/dotfiles/nixos";

      "cd.." = "cd ..";
      "cd-" = "cd -";

      hd = "hexdump -C";
      epoch = "date +%s";
      iso8601 = "date -Iseconds";
      ydl = "yt-dlp";
      rap = "rsync -raP";
      pubip = "curl icanhazip.com";
      clipboard = "if [ -n \"$WAYLAND_DISPLAY\" ]; then wl-copy; else xclip -selection clipboard; fi";
      procs = "nocorrect procs";
      difft = "nocorrect difft";

      dcbuild = "docker compose build";
      dcdown = "docker compose down";
      dcup = "docker compose up";
      dcupd = "docker compose up -d";
      dcdup = "docker compose down && docker compose up";

      gprev = "git switch -";
      gpusho = "git push -u origin $(git rev-parse --abbrev-ref HEAD)'";
      gpush = "git push";
      gpull = "git pull";

      scrsize = "printf '%sx%s\n' $COLUMNS $LINES";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
