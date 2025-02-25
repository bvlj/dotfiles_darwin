{
  enable = true;
  ignores = [
    ".DS_Store"
    "*~"
  ];

  lfs.enable = true;

  attributes = [
    "*.ipynb filter=ipynbStripOut"
    "*.bat   text eol=crlf"
  ];

  extraConfig = {
    branch.sort = "committerdate";

    core.ignorecase = false;

    diff = {
      algorithm = "histogram";
      colorMoved = true;
      tool = "vimdiff";
    };
    difftool.prompt = false;

    filter = {
      ipynbStripOut = {
        clean = "jq '.cells[].outputs = [] | .cells[].execution_count = null | .'";
        required = true;
        smudge = "cat";
      };
    };

    init.defaultBranch = "main";

    merge.conflictstyle = "zdiff3";

    user = {
      useConfigOnly = true;

      name = "Joey";
      email = "bevilacquajoey@gmail.com";

      lineage = {
        name = "Joey";
        email = "joey@lineageos.org";
      };

      personal = {
        name = "Joey";
        email = "bevilacquajoey@gmail.com";
      };

      usi = {
        name = "Joey Bevilacqua";
        email = "bevilj@usi.ch";
      };
    };
  };

  aliases = {
    id = "! git-identity";
    identity = "! git-identity";
    skip = "! git-skip";
    unskip = "! git-unskip";
    todo = "!git --no-pager diff --binary --no-color --cached | grep -i '^+.*todo'";
  };
}
