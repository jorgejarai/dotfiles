{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        user = "git";
        hostname = "ssh.github.com";
        port = 443;
        identityFile = "~/.ssh/github";
      };
      concordia = {
        hostname = "192.168.194.110";
      };
      "bitbucket.org" = {
        identityFile = "~/.ssh/bitbucket";
      };
      nocebo = {
        hostname = "192.168.194.10";
      };
      nocebo-wsl = {
        hostname = "192.168.194.10";
        port = 2222;
      };
      neutrino = {
        hostname = "192.168.194.105";
        user = "root";
      };
    };
  };
}
