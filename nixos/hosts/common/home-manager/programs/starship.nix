{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      command_timeout = 1300;
      scan_timeout = 50;
      format = "$env_var$hostname$directory$git_branch$git_status$time$status$cmd_duration$battery$character";
      env_var = {
        IN_NIX_SHELL = {
          format = "[\\[nix-shell\\] ](blue)";
        };
      };
      battery = {
        disabled = false;
        format = "[$percentage]($style) ";
      };
      character = {
        success_symbol = "[%](bold green)";
        error_symbol = "[%](bold red)";
      };
      cmd_duration = {
        disabled = false;
        format = "[$duration]($style) ";
        style = "bold purple";
      };
      git_branch = {
        disabled = false;
        format = "[$branch]($style) ";
      };
      hostname = {
        format = "[$ssh_symbol$hostname]($style) ";
      };
      status = {
        disabled = false;
        format = "[\\($int\\)]($style) ";
        recognize_signal_code = false;
        map_symbol = false;
      };
      time = {
        disabled = false;
        format = "[$time]($style) ";
        time_format = "%T";
      };
    };
  };
}
