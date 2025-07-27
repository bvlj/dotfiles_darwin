{
  enable = true;

  addKeysToAgent = "yes";

  extraConfig = ''
  IgnoreUnknown AddKeysToAgent,UseKeychain
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa
  '';

  matchBlocks = {
    "github.com" = {
      hostname = "ssh.github.com";
      port     = 443;
      user     = "bvlj";
    };

    "chokoka.cc" = {
      hostname = "chokoka.cc";
      port     = 2400;
      setEnv   = {
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
  };
}
