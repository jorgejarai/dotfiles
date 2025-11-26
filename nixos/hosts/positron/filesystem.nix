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
      "x-systemd.mount-timeout=30"
      "x-systemd.idle-timeout=0"
      "noauto"
      "gid=100" # users
      "file_mode=0664"
      "dir_mode=0775"
    ];
  };
}
