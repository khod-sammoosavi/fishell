set -Ux __FISHEll_IS_INSTALED true

if ! test -d $HOME/.fish/
  mkdir $HOME/.fish/
  cp $HOME/.config/fish/example-fishrc.fish $HOME/.fish/fishrc.fish
end
if ! test -f $HOME/.fish/fishrc.fish
  cp $HOME/.config/fish/example-fishrc.fish $HOME/.fish/fishrc.fish
end

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
set -g fish_prompt_pwd_dir_length 25
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always
# aliases
new_alias ls "exa --icons"
new_alias ll "exa -l -g -a --icons"
new_alias lt "exa --tree --icons -l -g"
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

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
