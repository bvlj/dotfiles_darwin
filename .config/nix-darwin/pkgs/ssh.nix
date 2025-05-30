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

    "luce" = {
      hostname = "luce.si.usi.ch";
      port     = 22;
      user     = "joey";
    };
  };
}
