# Based off of rkj-repos theme from oh-my-zsh

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[blue]%}?"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"

function my_git_prompt() {
  if [[ "$(git config --get oh-my-zsh.hide-status)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
    echo " %{$fg_bold[blue]%}<%{$fg_bold[yellow]%}${ref#refs/heads/} %{$fg_bold[blue]%}|$(git_prompt_short_sha) %{$fg_bold[blue]%}|%b $(git_prompt_status)%{$fg_bold[blue]%}>%b"
  fi
}

PROMPT=$'%{$fg_bold[blue]%}┌─[$(hostname)%{$fg_bold[blue]%} | %{$fg_bold[green]%}%~ %{$fg_bold[blue]%}| %b%{$fg[yellow]%}'%D{"⏳ %a, %b %e, %Y"}%B" · "%b%{$fg[yellow]%}%D{"%I:%M:%S ⌛"}%b$'%{$fg_bold[blue]%}]
%{$fg_bold[blue]%}└─[%{$fg_bold[magenta]%}%?%{$fg_bold[blue]%}]%b$(my_git_prompt)%{$reset_color%} '
PS2=$' \e[0;34m%}%B>%{\e[0m%}%b '
