#!/bin/bash

sudo apt update

# Install stow
sudo apt install stow -y

cd configs

for dir in */; do
    echo "Initiating stow for directory: $dir"
    stow -D $dir
    stow $dir -t ~
done

# If running WSL, VSCode needs to be in a seperate location
if grep -qi Microsoft /proc/version && [[ -f $HOME/.config/Code/User/settings.json ]]; then
  echo "Running WSL, symlinking VSCode settings"
  ln -sf $HOME/.config/Code/User/settings.json $HOME/.vscode-server/data/Machine/settings.json
fi

# If running VSCode install extensions
if which code >/dev/null; then
  echo "Installing VSCode extensions"
  cat vscode/extensions.txt | xargs -L 1 code --install-extension
else
  echo "VSCode command does not exist, not installing extensions"
fi
