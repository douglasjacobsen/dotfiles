#use extended color pallete if available
if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
    turquoise="$reset_color%F{81}"
    orange="$reset_color%F{166}"
    purple="$reset_color%F{135}"
    hotpink="$reset_color%F{161}"
    limegreen="$reset_color%F{118}"
else
    turquoise="$reset_color$fg_bold[cyan]"
    orange="$reset_color$fg_bold[yellow]"
    #purple="$fg_bold[magenta]"
    purple="$reset_color$fg[magenta]"
    hotpink="$reset_color$fg[red]"
    limegreen="$reset_color$fg[green]"
fi
red="$reset_color$fg[red]"
blue="$reset_color$fg[blue]"
yellow="$reset_color$fg_bold[yellow]"
green="$reset_color$fg_bold[green]"


 PROMPT=$'
%{$purple%}┌─[%{$red%}%n%{$purple%}][%{$yellow%}%m%{$purple%}][%{$turquoise%}%~%{$purple%}]$(git_prompt_info)%{$purple%}[%{$yellow%}%*%{$purple%}]%{$reset_color%}
%{$purple%}└─▪$reset_color '
# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$purple%}[%{$limegreen%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$purple%}]"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$green%}✔"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$red%}✗"
