# .dotfiles

A personal store of all [dotfiles](https://dotfiles.github.io/) to help transfer workflow across different machines. This repository uses a package [`stow`](https://www.gnu.org/software/stow/) - a symlink manager to create, manage and remove symlinks easily.

## Usage

1. Clone the repo

```bash
git clone https://github.com/khaleelsyed/.dotfiles.git
```

2. Install the dot files and other packages

```bash
cd .dotfiles

# NOTE: sudo access is needed to install stow
bash install.sh
```

3. Exit and restart new shell to ensure `pnpm` is usable

-----

## Attribution

Majority of the content from this repo has been taken from: [okwilkins/.dotfiles](https://github.com/okwilkins/.dotfiles)
