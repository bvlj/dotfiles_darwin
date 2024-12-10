{
  enable = true;
  ignores = [
    ".DS_Store"
    "*~"
  ];

  lfs.enable = true;

  extraConfig = {
    core.ignorecase = false;

    diff.tool = "vimdiff";
    difftool.prompt = false;

    user.useConfigOnly = true;

    user.name = "Joey";
    user.email = "bevilacquajoey@gmail.com";

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
    todo = "!git --no-pager diff --binary --no-color --cached | grep -i '^+.*todo'";
  };
}
