# ZSH Theme "f-u-shaq" by Shaq

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

function get_user() {
  echo "$USERNAME"
}

function get_curr_temp () {
 curl -s --connect-timeout 1 -m 1 "http://www.yr.no/place/Sweden/Stockholm/Stockholm/hour_by_hour.html" | grep -iE -m2 "Temperature" | sed -n "1p" | cut -d' '  -f10 | cut -d',' -f1
}

function get_dn_headline () {
 curl -s --connect-timeout 1 -m 1 http://www.dn.se/rss/senaste-nytt/ | grep -i -m2 title | grep -v "DN.se - Nyheter" | cut -d'[' -f3 | cut -d']' -f1
}

function get_svd_headline () {
 curl -s --connect-timeout 1 -m 1 "http://www.svd.se/?service=rss" | grep -iE "CDATA|title" | cut -d'[' -f3 | cut -d']' -f1 | sed -n '5p'
}

function get_fz_headline () {
 curl -s --connect-timeout 1 -m 1 http://www.fz.se/core/rss/fznews_rss20.xml | grep -i "title" | grep -v "Nyheter från FZ.se" | sed -n "1p" | cut -d'>' -f2 | cut -d'<' -f1
}

local return_status="%{$fg_bold[magenta]%}%(?..%?)" #%{$reset_color%}

PROMPT='
$fg[green]╭──→ᶠᵘᶜᵏᵧₒᵤ $fg[cyan]$(get_user)$fg[grey]@%m$fg[green] | $fg[blue]$(get_pwd)%{$reset_color%}$fg[grey]${return_status}$(git_prompt_info)$(git_prompt_status) %{$reset_color%}$fg[grey]| YR: $(get_curr_temp)℃  | DN: $(get_dn_headline) | SVD: $(get_svd_headline) | FZ: $(get_fz_headline)
$fg[green]╰─♎→%B%b%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" - "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"
