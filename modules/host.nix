{ pkgs, ... }:
let
  hostname = "hyperbolic-hare";
  username = "joey";
in {
  networking = {
    computerName = hostname;
    hostName = hostname;
  };

  nix.settings.trusted-users = [ username ];

  system = {
    defaults.smb.NetBIOSName = hostname;
    primaryUser = username;
  };

  users = {
    knownUsers = [ username ];

    users."${username}" = {
      home  = "/Users/${username}";
      uid   = 501;
    };
  };
}
