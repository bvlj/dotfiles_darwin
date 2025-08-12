{
  enable = true;

  shellAliases = {
    # cd
    "..."    = "cd ../..";
    "...."   = "cd ../../..";
    croot    = "cd \"./\$(git rev-parse --show-cdup 2>/dev/null)\" 2> /dev/null";
    # grep
    grep     = "grep --color=auto";
    # ls
    ls       = "ls -1";
  };
}
