#!/bin/zsh

if [ "$(uname -s)" = "Darwin" ]; then
  brew cask install sublime-text3
  ST3_LOCAL="$HOME/Library/Application Support/Sublime Text 3"
else
  ST3_LOCAL="$HOME/.config/sublime-text-3"
fi

# create needed directories
mkdir -p "$ST3_LOCAL/Installed Packages"
mkdir -p "$ST3_LOCAL/Packages/User/"

# Install Package Control
PKG_CTRL_FILE="$ST3_LOCAL/Installed Packages/Package Control.sublime-package"
[ ! -f "$PKG_CTRL_FILE" ] && curl -o "$PKG_CTRL_FILE" \
  "https://sublime.wbond.net/Package Control.sublime-package"

# Link keymaps
for platform in OSX Linux; do
  ln -sf "$ZSH/sublime-text-3/Default.sublime-keymap" \
    "$ST3_LOCAL/Packages/User/Default ($platform).sublime-keymap"
done

# Link all sublime-settings files
ln -sf "$ZSH/sublime-text-3/"*.sublime-settings "$ST3_LOCAL/Packages/User/"

unset ST3_LOCAL
unset PKG_CTRL_FILE
