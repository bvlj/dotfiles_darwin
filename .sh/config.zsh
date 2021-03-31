# Plugins
if [ -f $HOME/.antigen/antigen.zsh ]; then
    source $HOME/.antigen/antigen.zsh
    antigen bundle zsh-users/zsh-autosuggestions
    antigen bundle zsh-users/zsh-history-substring-search
    antigen bundle zsh-users/zsh-syntax-highlighting
    antigen apply
fi

# Beep
setopt nobeep

# Compinit
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# Custom key bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[H' backward-word
bindkey '^[[F' forward-word

# History
setopt share_history
setopt append_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_reduce_blanks

# Theme
autoload -Uz vcs_info
autoload -U add-zsh-hook

vcs_precmd() { vcs_info }

add-zsh-hook precmd vcs_precmd
setopt prompt_subst

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' actionformats '%F{green}(%a%c%u%m)%f '
zstyle ':vcs_info:*' formats '%F{green}(%b%c%u%m)%f '

PROMPT='%B%F{blue}%(!.%1~.%~)%f ${vcs_info_msg_0_}%(!.#.$)%b '