#!/bin/bash

sudo apt update

# Install stow
sudo apt install curl stow unzip -y

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
  cat vscode/.vscode_extensions.txt | xargs -L 1 code --install-extension
else
  echo "VSCode command does not exist, not installing extensions"
fi

rm ~/.vscode_extensions.txt

# Installs fnm (Fast Node Manager)
if ! curl -fsSL https://fnm.vercel.app/install | bash; then
  exit 1;
fi

echo "Running env var stuff" # DEV
FNM_PATH="/home/khaleel/.local/share/fnm"
export PATH="$FNM_PATH:$PATH"
eval "`fnm env`"

# Download and install Node.js (latest LTS version)
if ! fnm install --lts; then
  echo "Failed to install Node.js"
  exit 1;
fi

# Install pnpm
if curl -fsSL https://get.pnpm.io/install.sh | sh -; then
  exit 0;
else
  echo "Failed to install pnpm"
  exit 1;
fi

exit 0;
