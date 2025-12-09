{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Jorge Jara";
        email = "jorgejarainostroza@gmail.com";
      };

      alias = {
        br = "branch";
        chucrut = "checkout";
        ci = "commit";
        ddiff = "-c diff.external=difft diff";
        dshow = "-c diff.external=difft show --ext-diff";
        hist = "log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short";
        st = "status";
        tree = "log --graph --oneline --all";
        co = "checkout";
        dlog = "-c diff.external=difft log --ext-diff";
      };

      commit.gpgSign = true;
      delta.enable = true;
      init.defaultBranch = "main";
      pull.rebase = false;
      url = {
        "git@github.com:" = {
          insteadOf = [
            "https://github.com"
          ];
        };
      };
      user = {
        signingKey = "B49E6CD1";
      };
    };
  };
}
