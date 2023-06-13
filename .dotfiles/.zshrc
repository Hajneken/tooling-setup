# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bira"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the uto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git nvm zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5f5f5f,underline"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias p="cd ~/projects"
alias u="cd ~/UNI"
alias p1="cd /home/hajnek/UNI/p1/12010957-hynek-zemanec"
alias p2="cd /home/hajnek/UNI/p2/12010957-hynek-zemanec"
alias p2app="cd /home/hajnek/UNI/p2/12010957-hynek-zemanec/src/app-driver-logbook"
alias note="gedit ~/Documents/notes/'$(date '+%A_%W_%Y'.md)'"


learnnode(){
    code /home/hajnek/projects/learning_node ; 
    firefox --new-tab https://www.udemy.com/course/understand-nodejs ;
}

# current 
alias current="cd /home/hajnek/projects/portfolio-2_0/next/src"

#GIT 
# configure as github user 
github(){
    git config user.email 25231320+Hajneken@users.noreply.github.com ;
    git config user.name "Hynek Zemanec" ; 
}

gitlab(){
    git config user.email hynekz20@unet.univie.ac.at ;
    git config user.name "Hynek Zemanec" ; 
}

# magnet
magnet() {
    transmission-gtk "magnet:?xt=urn:btih:$1";
}

#copy to clipboard
copy(){
	$1 | xclip -sel clip
}

# Colors for man pages
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

#Utils 
alias c="clear"
alias v="nvim"
alias cat='batcat --paging=never'
alias l='exa -lag --header'
alias ls='exa'

# FZF 
# KeyBindings
. /usr/share/doc/fzf/examples/key-bindings.zsh

alias f='fzf --preview "batcat --style numbers --color=always {}"'
#cd with fzf
cdf(){cd "$(fdfind -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" && echo "$PWD" && tree -L 1 
}

# preview files with space
export FZF_CTRL_T_OPTS='--preview "batcat --style numbers --color=always {}" --bind="space:toggle-preview" --preview-window=:hidden'
# preview directory tree structure with space
export FZF_ALT_C_OPTS='--preview="exa --tree --level 1 {}" --bind="space:toggle-preview" --preview-window=:hidden'


#python 
export PATH=/home/hajnek/anaconda3/bin:$PATH

# create a new MD note 1 per each day, append to existing
alias note='echo "# Note $(date +%Y-%m-%d_%H:%M:%S)\n\n" >> ~/docs/$(date +%Y-%m-%d)_note.md && vim +$ $(date +%Y-%m-%d)_note.md'

#Launch Google Calendar as App
alias calendar="firefox 'https://calendar.google.com/calendar/u/0/r'"

alias plan="brave --app='https://calendar.google.com/calendar/u/0/r'; brave --new-window https://www.notion.so/hynek/TODO-774a1b148f3b4e2ea694d003d6bf6939 https://track.toggl.com/timer"

alias track="firefox 'https://track.toggl.com/timer'"

#ANDROID 
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
