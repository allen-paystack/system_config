# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Aliases to load
alias startredis="redis-server /usr/local/etc/redis.conf"
alias startmongo="brew services start mongodb-community@4.2"
alias restartmongo="brew services restart mongodb-community@4.2"
alias stopmongo="brew services stop mongodb-community@4.2"
alias allowsleep="sudo pmset -a disablesleep 0"
alias disablesleep="sudo pmset -a disablesleep 1"
alias viewsettings="pmset -g"
alias reset_audio="sudo kill -9 `ps ax|grep 'coreaudio[a-z]' | awk '{print $1}'`"

# Functions
function pull_reset_merge_into_dev() {
    branch=$(git symbolic-ref --short -q HEAD)
    git checkout dev && git reset --hard origin/dev && git merge $branch
}

function pull_reset_to() {
    git checkout "$1" && git reset --hard origin/"$1"
}

function checkout_pull(){
    git checkout "$1" && git pull
}

function push_first_time() {
    branch=$(git symbolic-ref --short -q HEAD)
    git push --set-upstream origin $branch
}

