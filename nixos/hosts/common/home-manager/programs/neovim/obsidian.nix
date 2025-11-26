{
  programs.nixvim.plugins.obsidian = {
    enable = true;
    settings = {
      workspaces = [
        {
          name = "Notas";
          path = "~/Documentos/Notas";
        }
      ];
    };
  };
}
