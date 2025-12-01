{
  enable = true;

  enableDefaultConfig = false;

  extraConfig = ''
    IgnoreUnknown AddKeysToAgent,UseKeychain
    UseKeychain yes
    IdentityFile ~/.ssh/id_rsa
    '';
#   ForwardAgent no
  # AddKeysToAgent yes
  # Compression no
  # ServerAliveInterval 0
  # ServerAliveCountMax 3
  # HashKnownHosts no
  # UserKnownHostsFile ~/.ssh/known_hosts
  # ControlMaster no
  # ControlPath ~/.ssh/master-%r@%n:%p
  # ControlPersist no
  matchBlocks = {
    "*" = {
      addKeysToAgent      = "yes";
    };

    "github.com" = {
      hostname = "ssh.github.com";
      port     = 443;
      user     = "bvlj";
    };

    "balmy-butterfly" = {
      addKeysToAgent = "yes";
      hostname       = "balmy-butterfly";
      port           = 2400;
      setEnv         = {
        TERM = "xterm-256color";
      };
    };

    "luce" = {
      hostname = "luce.si.usi.ch";
      port     = 22;
      user     = "joey";
      setEnv   = {
        TERM = "xterm-256color";
      };
    };

    "luce-nas" = {
      hostname = "10.40.0.80";
      port     = 22;
      user     = "Joey";
      setEnv   = {
        TERM = "xterm-256color";
      };
    };
  };
}
