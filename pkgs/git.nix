{
  enable  = true;
  ignores = [
    ".DS_Store"
    "*~"
  ];

  lfs.enable = true;

  attributes = [
    "*.ipynb filter=ipynbStripOut"
    "*.bat   text eol=crlf"
  ];

  settings = {
    alias = {
      coauth = "! git commit --amend --trailer \"Co-Authored-By: $(git config user.name) <$(git config user.email)>\"";
      lg     = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative";
      skip   = "! git-skip";
      unskip = "! git-unskip";
      squash = "! git-squash";
      todo   = "! git --no-pager diff --binary --no-color --cached | grep -i '^+.*todo'";
    };

    branch.sort = "committerdate";

    core.ignorecase = false;

    diff = {
      algorithm  = "histogram";
      colorMoved = true;
      tool       = "vimdiff";
    };

    difftool.prompt = false;

    filter = {
      ipynbStripOut = {
        clean    = "jq '.cells[].outputs = [] | .cells[].execution_count = null | .'";
        required = true;
        smudge   = "cat";
      };
    };

    init.defaultBranch = "main";

    log.date = "iso";

    merge.conflictstyle = "zdiff3";

    user = {
      name  = "Joey";
      email = "bevilacquajoey@gmail.com";
    };
  };
}
