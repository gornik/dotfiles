
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}[ "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%} ]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ●"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%} ●"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ●"

terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]

vim_ins_mode="%{$fg[yellow]%}-- INSERT --%{$reset_color%}"
vim_cmd_mode="" #"%{$fg[black]%}NORMAL%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

PROMPT='
%{$bg[black]%}%n@%m %{$fg_bold[white]%}%~ $(git_prompt_info_untracked) %E%{$reset_color%}
%{$terminfo_down_sc${vim_mode}$terminfo[rc]%}❯ '

preexec () { print -rn -- $terminfo[el]; }

RPROMPT=''

function git_prompt_info_untracked() {
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty_untracked)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

parse_git_dirty_untracked() {
    local GIT_STATUS=''
    local PARSE_GIT_DIRTY="$(parse_git_dirty)"
    if [[ "$PARSE_GIT_DIRTY" == "$ZSH_THEME_GIT_PROMPT_DIRTY" ]]; then
        if [[ -n "$(command git status --porcelain | grep -E '^.\S')" ]]; then
            echo "$ZSH_THEME_GIT_PROMPT_UNTRACKED"
        else
            echo "$PARSE_GIT_DIRTY"
        fi
    else
        echo "$PARSE_GIT_DIRTY"
    fi
}

