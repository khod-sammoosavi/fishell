#! /usr/bin/fish

clear

printf \
"\

$(set_color green) $(set_color normal) Fishell installer
$(set_color grey)  Fishell is the same as fish shell.
  A library for Fish Shell that provides you with basic functionality.$(set_color normal)
\n"

function confirm
  if not test (count $argv) -eq 0
    set -l message $argv[1]
    while true
      echo ""
      echo "  $message"
      read -l -P $(set_color grey)"[Y]es or [N]o (default: no) : " confirm_res
      switch $confirm_res
      case y Y Yes yes YES
        return 0
      case n N No N0 ""
        return 1
      end
    end
  end
end

function backup
  if test -d $HOME/.config/fish || test -d $HOME/.local/share/fish
    if confirm "Do you want to $(set_color -o green)'backup'$(set_color normal) your previous fish shell configurations ?"
      mv $HOME/.config/fish $HOME/.config/fish.old
      mv $HOME/.local/share/fish $HOME/.local/share/fish.old
    else if confirm "Do you want to $(set_color -o red)'delete'$(set_color normal) your previous fish shell configurations ?"
      rm -i $HOME/.config/fish
      rm -i $HOME/.local/share/fish
    end
  end
end

echo "$(set_color blue)$(set_color normal)  Backup old configurations"
if not $__FISHEll_IS_INSTALED
  echo "$(set_color yellow)  Oops! Config directories were found for fish! Either take a backup of your configs or delete them.$(set_color normal)"
  backup
else
  echo "Skipped!"
end

function clone_fishell
  echo ""
  echo "$(set_color blue)$(set_color normal)  Clone the Fishell repository"
  if not test -d $HOME/.config/fish
    git clone -b main https://github.com/khod-sammoosavi/fishell.git $HOME/.config/fish
  else
    echo "Skipped!"
  end
end

clone_fishell

# change default shell
if confirm "Do you want to change default shell ?"
  chsh -s /usr/bin/fish
end

echo ""
echo "$(set_color green)$(set_color normal)  Fishell was installed completely."
echo "$(set_color green)$(set_color normal)  To configure fishell, go to the file $(set_color -o)`fishrc.fish`$(set_color normal) in the path $(set_color -o)`$HOME/.fish/`$(set_color normal) ."
