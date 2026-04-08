# Source device-specific config (paths, etc.)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'm:{A-Z}={a-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Colors
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"

# Aliases
alias ll='ls -la'
alias code="open -a 'Visual Studio Code'"
alias vi='nvim'
alias vim='nvim'

# Git prompt
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' %F{green}(%b)%f'
PROMPT='%F{cyan}%~%f${vcs_info_msg_0_} %# '
