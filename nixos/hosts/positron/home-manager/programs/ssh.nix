{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        forwardAgent = true;
        addKeysToAgent = "no";
        compression = false;
        serverAliveInterval = 0;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
        userKnownHostsFile = "~/.ssh/known_hosts";
        controlMaster = "no";
        controlPath = "~/.ssh/master-%r@%n:%p";
        controlPersist = "no";
      };
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
