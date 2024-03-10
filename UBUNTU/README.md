# UBUNTU setup 

1. clone to home directory
2. create symlinks to the corresponding destinations (usually `~/`)
3. profit

## Install packages (**EXPERIMENTAL**) 

export manually installed packages to an `.installed_packages`

```shell
dpkg --get-selections | grep 'install$' | awk '{print $1}' > ~/tooling-setup/UBUNTU/.dotfiles/.installed_packages

```
install packages from `.installed_packages`

```shell
sudo apt-get install $(cat ~/tooling-setup/UBUNTU/.dotfiles/.installed_packages) -y
```

## ZSH 

1. install ZSH (if not already installed)
2. install [oh-my-zsh](https://ohmyz.sh/#install)

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

3. install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

4. install [zsh-syntaxhighlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

make a symlink

```shell
ln -s ~/tooling-setup/UBUNTU/.dotfiles/.zshrc ~/.zshrc
```

## NeoVIM (nvim)

install [vim-plug](https://github.com/junegunn/vim-plug) and move `autoload` from `~/.vim` to `~/.config/nvim`

```shell
mv ~/.vim/autoload ~/.config/nvim
```

add the config file

```shell
ln -s ~/tooling-setup/UBUNTU/init.vim ~/.config/nvim/init.vim 
```

open `nvim` and run `:PlugInstall`


## WSL 

If WSL starts as root, in PowerShell run

```powershell
ubuntu config --default-user YOURUSERNAME
```