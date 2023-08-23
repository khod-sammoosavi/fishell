set -g cyan (set_color -o white)
set -g yellow (set_color -o white)
set -g red (set_color -o white)
set -g blue (set_color -o white)
set -g green (set_color -o white)
set -g purple (set_color -o white)
set -g normal (set_color white)

set -g whitespace " "

set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set __fish_git_prompt_showdirtystate "yes"
set __fish_git_prompt_showstashstate "yes"
set __fish_git_prompt_showuntrackedfiles "yes"
set __fish_git_prompt_showupstream "yes"
set __fish_git_prompt_color_branch purple
set __fish_git_prompt_color red
set __fish_git_prompt_char_stateseparator ""
set __fish_git_prompt_char_dirtystate "U"
set __fish_git_prompt_char_stagedstate "S"
set __fish_git_prompt_char_untrackedfiles "!"
set __fish_git_prompt_char_stashstate "B"
set __fish_git_prompt_char_upstream_ahead "!"
set __fish_git_prompt_char_upstream_behind "U"
set __fish_git_prompt_char_cleanstate ""
set __fish_git_prompt_color_prefix blue
set __fish_git_prompt_color_suffix blue

function fish_prompt
set last_status $status
export VIRTUAL_ENV_DISABLE_PROMPT=1

if test -e package.json
set node_prompt $green " ⬢ (node)"
end

if test $last_status = 0
set initial_indicator $blue"[$normal$USER$red@$normal$hostname$blue]"
set status_indicator "$normal❯$cyan❯$green❯$purple❯"
else
set initial_indicator $blue"[$normal$USER$red@$normal$hostname$blue]"
set status_indicator "$red❯$red❯$red❯$red❯"
end
if set -q VIRTUAL_ENV
set venv $whitespace (set_color yellow) " (" (basename "$VIRTUAL_ENV") (set_color yellow) ")"
end

printf "%s%s%s%s%s%s%s%s%s" $initial_indicator $whitespace $cyan(basename (prompt_pwd)) $(__fish_git_prompt) $venv $node_prompt $whitespace $status_indicator $whitespace

end
