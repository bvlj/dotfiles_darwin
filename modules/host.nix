{ pkgs, username, hostname, ... }:
{
  networking = {
    computerName = hostname;
    hostName = hostname;
  };

  nix.settings.trusted-users = [ username ];

  system = {
    defaults.smb.NetBIOSName = hostname;
    primaryUser = username;
  };

  users.users = {
    "${username}" = {
      home  = "/Users/${username}";
      uid   = 501;
    };
  };
}
