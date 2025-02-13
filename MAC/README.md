# MAC 

1. clone to home directory
2. create symlinks to the corresponding destinations (usually `~/`)
3. profit

It is a good idea to install font first: [JetBrains Mono](https://www.jetbrains.com/lp/mono/) 

## BREW 
software [ package manager for MAC](https://brew.sh/) 

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

make a symlink

```shell
ln -s ~/tooling-setup/MAC/.dotfiles/.zshrc ~/.zshrc 
```

## NeoVIM (nvim)

install [vim-plug](https://github.com/junegunn/vim-plug) and move `autoload` from `~/.vim` to `~/.config/nvim`

```shell
mv ~/.vim/autoload ~/.config/nvim
```

add the config file

```shell
ln -s ~/tooling-setup/MAC/init.vim ~/.config/nvim/init.vim 
```

open `nvim` and run `:PlugInstall`

## Tmux 
information in `.tmux.conf`

```shell
ln -s ~/tooling-setup/MAC/.dotfiles/tmux.conf ~/.tmux.conf 
```

`prefix` is `alt` + `w` (on MAC `option` + `w`)
in `tmux` to install plugins press `prefix` + `I`

## VS Code

```shell
ln -s ~/tooling-setup/vscode/settings.json ~/.vscode/settings.json
```


