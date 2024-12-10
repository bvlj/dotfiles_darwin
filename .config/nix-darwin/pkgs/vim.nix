{ pkgs, ... }: {
  enable = true;

  defaultEditor = true;

  extraConfig = ''
  set autoindent
  set smarttab
  filetype plugin indent on

  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
  augroup END

  syntax on

  set hlsearch
  set incsearch
  set showmatch

  set viminfofile=NONE
  '';

  plugins = with pkgs.vimPlugins; [
    vim-gitgutter
    vim-indent-guides
    vim-sensible
  ];

  settings = {
    expandtab = true;
    ignorecase = true;
    number = true;
    shiftwidth = 2;
    tabstop = 2;
  };
}
