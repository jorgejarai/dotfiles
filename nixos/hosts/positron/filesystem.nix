{
  config,
  lib,
  pkgs,
  ...
}: {
  fileSystems."/mnt/nas" = {
    device = "//192.168.194.16/nas";
    fsType = "cifs";
    options = [
      "credentials=/etc/smbcredentials"
      "_netdev"
      "x-systemd.automount"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"
      "x-systemd.idle-timeout=60"
      "noauto"
      "uid=1000"
      "gid=100" # users
    ];
  };
}
