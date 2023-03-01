# dotfiles

This repository contains scripts and configuration files that can be used to bootstrap a new computer.

## Initial Setup

1. Install any OS/Software updates that are available
2. Setup your user (picture, name, iCloud/Apple account)

## Clone Repo

All of the configurations and scripts are managed in the repo so clone it to get started:

```bash
git clone git@github.com:lvauthrin/dotfiles.git ~/.dotfiles
```

## System Settings

Run the `system-settings.bash` script to set initial Mac OS System Settings.

Later on, we'll be installing additional Xcode components.

## Install Apps and Tools

### Xcode Command Line Tools

Install Xcode command line tools
```bash
xcode-select --install
```

### Install Homebrew

Install Homebrew so we can install the rest of our apps/packages.
    
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/lvauthrin/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/lvauthrin/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Test Homebrew install
brew doctor && brew update
```

Install Homewbrew apps/tools:
```bash
brew bundle install --file setup/Brewfile
```

### LazyVim
```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# Install
git clone https://github.com/LazyVim/starter ~/.config/nvim

# Set default EDITOR
echo 'EDITOR="nvim"' >> /Users/lvauthrin/.zshenv
```

### SDKMan
```bash
curl -s "https://get.sdkman.io" | bash
# Install latest Java version (needed by JDTLS)
sdk install java 17.0.5-tem
```

### Oh-My-Zsh
```bash
# Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Zsh completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

# You may also need to force rebuild `zcompdump`:
rm -f ~/.zcompdump; compinit

# Additionally, if you receive "zsh compinit: insecure directories" warnings when attempting to load these completions, you may need to run this:
chmod -R go-w '/opt/homebrew/share/zsh'

# Install Oh-My-ZSH plugins
PLUGINS="bazel brew git history-substring-search z"
sed -I {} "s/plugins=(.*)/plugins=($PLUGINS)/" ~/.zshrc
```

## Post-Setup Configuration

### Xcode licenses
```bash
sudo xcodebuild -license
```

### Espanso Configurations
```bash`
espanso install all-emojis
```

## Managing Dotfiles

Dotfiles are managed via [rcm](https://github.com/thoughtbot/rcm) which can be installed via Brew.  For the initial install of the dotfiles, run:
```bash
env RCRC=$HOME/.dotfiles/rcrc rcup -v
```

Afterwards, to sync the repository content to your computer's home directory:
```bash
rcup -v
```

To add a file to be managed:
```bash
mkrc -v ~/.file-to-be-managed
```

To remove a file from being managed:
```bash
rcdn -v file-to-be-managed
rm file-to-be managed
```

To see files that are currently managed:
```bash
lsrc
```

## Resources

This repository was inspired by a few sources:
- [macOS Setup Guide](https://sourabhbajaj.com/mac-setup/)
- [How to Setup a Mac for Software Development](https://www.stuartellis.name/articles/mac-setup/#spotlight)
- [How to Install Xcode With or Without Homebrew on a Mac](https://www.moncefbelyamani.com/how-to-install-xcode-with-homebrew/)
- [rcup dotfiles] https://github.com/thoughtbot/rcm






Install
-------

Install [rcm](https://github.com/thoughtbot/rcm):

Clone onto your laptop:


Install the dotfiles:

    env RCRC=$HOME/.dotfiles/rcrc rcup -v

Usage
-----

Sync the repository content to your computer's home directory:

    rcup -v

Add a file to be managed:

    mkrc -v ~/.file-to-be-managed

Remove a file from being managed:

    rcdn -v file-to-be-managed
    rm file-to-be managed

See files that are currently managed:

    lsrc
