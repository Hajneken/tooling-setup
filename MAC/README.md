# MAC 

## Update
1. run `./sync.sh`
2. and update using `./update.sh`

## Environment Setup

1. Check preequisites first
1. clone to home directory
1. run `./setup.sh`
1. profit

## Preequisites

It is a good idea to install font first: [JetBrains Mono](https://www.jetbrains.com/lp/mono/) 

## BREW 
software [ package manager for MAC](https://brew.sh/) 

install using 
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

information about software is contained in `Brewfile`

install apps from `Brewfile` (navigate to directory where the brewfile is contained)

```shell
brew bundle
```

generate `Brewfile` that contains all installed programs on MAC:

```shell
brew bundle dump --describe 
```

## ZSH 

install ZSH (if not already installed)

install [oh-my-zsh](https://ohmyz.sh/#install)

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

install [zsh-syntaxhighlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```




