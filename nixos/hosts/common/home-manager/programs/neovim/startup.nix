{
  programs.nixvim.plugins.startup = {
    enable = true;

    sections.body = {
      type = "mapping";
      oldfilesDirectory = false;
      align = "center";
      foldSection = false;
      title = "Menu";
      margin = 5;
      content = [
        [
          " Find file"
          "Telescope find_files"
          "ff"
        ]
        [
          "󰍉 Grep find"
          "Telescope live_grep"
          "fr"
        ]
        [
          " recent files"
          "Telescope oldfiles"
          "fg"
        ]
        [
          " file browser"
          "Telescope file_browser"
          "fe"
        ]
        [
          " Copilot Chat"
          "CopilotChat"
          "ct"
        ]
      ];
      highlight = "string";
      defaultColor = "";
      oldfilesAmount = 0;
    };

    parts = [
      "body"
    ];
  };
}
