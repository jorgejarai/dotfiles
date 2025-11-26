{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shortcut = "a";
    aggressiveResize = true;
    escapeTime = 0;
    historyLimit = 100000;
    mouse = true;
    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_date_time "%Y-%m-%d %H:%M"
          set -g @catppuccin_window_tabs_enabled on
          set -g @catppuccin_flavour 'latte'
        '';
      }
      tmuxPlugins.sensible
      tmuxPlugins.weather
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.tmux-fzf
    ];
    extraConfig = ''
      # Shift+Alt to move between windows
      bind -n M-H previous-window
      bind -n M-L next-window

      # Ctrl+Alt+L to clear screen on the shell
      bind -n C-M-l send-keys 'C-l'

      # Split panes using <prefix> | and <prefix> -
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %
    '';
  };
}
