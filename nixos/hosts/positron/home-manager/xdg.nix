{pkgs, ...}: {
  xdg.dataFile = {
    "icons/hicolor/512x512/apps/nethack.png".source = ../../common/icons/nethack.png;
  };

  xdg.desktopEntries = {
    nethack = {
      name = "NetHack (alt.org)";
      exec = "${pkgs.wezterm}/bin/wezterm --config initial_cols=130 --config initial_rows=40 ssh nethack@alt.org";
      icon = "nethack";
      terminal = false;
      type = "Application";
      categories = ["Game" "ActionGame"];
      mimeType = ["text/plain"];
      startupNotify = false;
    };
  };
}
