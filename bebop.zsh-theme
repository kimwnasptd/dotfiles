# Custom Prompt

# Version Control System
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%F{28}(%b)'

setopt PROMPT_SUBST

NEWLINE=$'\n'
#PROMPT='╭ %2~@%M ${vcs_info_msg_0_}${NEWLINE}╰ %{$reset_color%}'
PROMPT='%F{52}╭ %F{cyan}%2~%F{52}@%F{3}%M ${vcs_info_msg_0_}%F{22}$(virtualenv_prompt_info)${NEWLINE}%F{52}╰ %{$reset_color%}'
