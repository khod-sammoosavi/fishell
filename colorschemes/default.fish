set -g cyan (set_color -o cyan)
set -g yellow (set_color -o yellow)
set -g red (set_color -o red)
set -g blue (set_color -o blue)
set -g green (set_color -o green)
set -g purple (set_color -o purple)
set -g normal (set_color normal)
set -g grey (set_color -o grey)

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
set venv $(set_color yellow)"  ("(basename "$VIRTUAL_ENV")")"
end

function seperator #defines the function, you can use any other name for it
  for i in (seq $argv[2]) #starts a for loop that will repeat as many times as second argument given
    printf $blue$argv[1] #prints the first argument given (the string)
  end
end

seperator "-" $(tput cols)

set prompt $initial_indicator $whitespace (prompt_pwd) $(__fish_git_prompt) $venv $node_prompt \n$status_indicator $whitespace

printf "\n%s%s%s%s%s%s%s%s%s" $prompt

function fish_right_prompt
  if test $status = 0
  echo $green $(date "+%r") ' '
  else
  echo $red $(date "+%r") ' '
  end
end

end
