if ! test -d $HOME/.fish/
  mkdir $HOME/.fish/
  cp ./example-fishrc.fish ~/.fish/fishrc.fish
end
if ! test -f $HOME/.fish/fishrc.fish
  cp ./example-fishrc.fish ~/.fish/fishrc.fish
end

if status is-interactive
  function new_alias
    alias $argv
  end
  # load user config file
  source $HOME/.fish/fishrc.fish
  # set welcome message
  set fish_greeting $welcome_message
  # term color
  set -gx TERM xterm-256color
  # pager
  set -gx PAGER less
  # theme
  set -g theme_color_scheme terminal-dark
  set -g fish_prompt_pwd_dir_length 1
  set -g theme_display_user yes
  set -g theme_hide_hostname no
  set -g theme_hostname always
  # aliases
  new_alias ls "exa --icons"
  new_alias ll "exa -l -g -a --icons"
  new_alias lt "exa --tree --icons -l -g"
  new_alias mirror "sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
  new_alias mirrord "sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
  new_alias mirrors "sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
  new_alias mirrora "sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
  new_alias grep "grep --color=always"
  new_alias egrep "egrep --color=always"
  new_alias cp "cp -i"
  new_alias mv "mv -i"
  new_alias rm "rm -i"
  new_alias disk "df -h"
  new_alias sysctl "systemctl list-unit-files --state=enabled"
  # default editor
  set -gx EDITOR $editor
  # add paths
  set -gx PATH bin $PATH
  set -gx PATH $HOME/bin $PATH
  set -gx PATH $HOME/.local/bin $PATH
  set -gx PATH $HOME/.cargo/bin $PATH
  set -gx PATH $PATH
  # nodejs
  set -gx PATH node_modules/.bin $PATH
  # go
  set -g GOPATH $HOME/go
  set -gx PATH $GOPATH/bin $PATH
  # prompt
  source (dirname (status --current-filename))/colorschemes/$colorscheme.fish
end
