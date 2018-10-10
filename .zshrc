# Path to your oh-my-zsh installation.

export ZSH=/Users/khayyamsaleem/.oh-my-zsh

DEFAULT_USER=khayyamsaleem
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(sudo extract zsh-autosuggestions osx chucknorris hub colored-man adb git brew zsh-syntax-highlighting)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Applications/Racket v6.7/bin"
# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

fortune -o -s
alias fb='open https://facebook.com'
alias github="open http://github.com/khayyamsaleem"
# function stevens () {
#     if [[ $1 = "-u" ]]; then
#         echo "unmounting"
#         cd
#         sudo umount /Volumes/stevens
#     else
#          echo "mounting";
#          mkdir /Volumes/stevens/
#          mount -t smbfs //ksaleem@storage01.stevens.edu/ms/ /Volumes/stevens/
#          cd /Volumes/stevens/
#      fi
# }

alias phploc="php -S localhost:8000 -t . &;"
alias dog="pygmentize -g"
alias ll="ssh ksaleem@linux-lab.cs.stevens.edu"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/khayyamsaleem/.sdkman"
[[ -s "/Users/khayyamsaleem/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/khayyamsaleem/.sdkman/bin/sdkman-init.sh"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PKG_CONFIG_PATH=/opt/local/lib/pkgconfig:$PKG_CONFIG_PATH
function mconvert () {
    ffmpeg -i $2 -vcodec copy -acodec copy $2.$1
}
alias emacs="emacs -nw"

#ZPLUG STUFF
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
alias catimg="imgcat"
export PATH="/usr/local/opt/ncurses/bin:$PATH"

# OPAM configuration
. /Users/khayyamsaleem/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
    tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }
# https://gist.github.com/800227d0ef3324a3f68cdfd1a2cb5f00
# https://gist.github.com/0a3be946dd3824b520e3cb06c2d453fe
export PATH="/usr/local/opt/elasticsearch@5.6/bin:$PATH"
export PATH="/usr/local/texlive/2018/bin/x86_64-darwin:$PATH"
export MEDACCESS_CONFIG=/Users/khayyamsaleem/dev/medaccess/settings.cfg
export PATH="$HOME/.meteor:$HOME/Library/Haskell/bin:$PATH"
# alias emacs='/usr/local/bin/emacs -nw $1'
export PATH=~/dev/flutter/bin:$PATH
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk":
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home


