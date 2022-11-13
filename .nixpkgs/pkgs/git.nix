{
  enable = true;
  ignores = [
    ".DS_Store"
    "*~"
  ];

  extraConfig = {
    user.useConfigOnly = true;

    user.personal.name = "Joey";
    user.personal.email = "bevilacquajoey@gmail.com";

    user.usi.name = "Joey Bevilacqua";
    user.usi.email = "bevilj@usi.ch";

    user.lineage.name = "Joey";
    user.lineage.email = "joey@lineageos.org";
  };

  aliases = {
    id = "! git-identity";
    identity = "! git-identity";
    skip = "! git-skip";
    unskip = "! git-unskip";
  };
}
