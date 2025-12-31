{
  wsl = {
    enable = true;
  
    defaultUser = "jorge";
    wslConf.network = {
      generateResolvConf = false;
      generateHosts = false;
    };
  };
}
