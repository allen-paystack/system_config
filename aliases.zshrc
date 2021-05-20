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
alias start_kafka="zookeeper-server-start /usr/local/etc/kafka/zookeeper.properties & kafka-server-start /usr/local/etc/kafka/server.properties"
alias commit="git commit -S"

# Variable declarations
last_branch='master'

# Functions

# Switch into dev and reset it to the origin.
# Then merge changes (from the branch you switched from) into dev
# Usage: pull_reset_merge_into_dev
function pull_reset_merge_into_dev() {
    branch=$(git symbolic-ref --short -q HEAD)
    last_branch=$branch
    git checkout dev
    git fetch
    git reset --hard origin/dev
    git merge $branch
}

function pull_merge_into_dev() {
    branch=$(git symbolic-ref --short -q HEAD)
    last_branch=$branch
    git checkout dev
    git pull
    git merge $branch
}

# Checkout a branch and reset it to it's origin
# Usage: pull_reset_to {branch name}
function pull_reset_to() {
    branch=$(git symbolic-ref --short -q HEAD)
    last_branch=$branch
    git checkout "$1"
    git reset --hard origin/"$1"
}

# Checkout a branch and pull from it's origin
# Usage: checkout_pull {branch name}
function checkout_pull(){
    branch=$(git symbolic-ref --short -q HEAD)
    last_branch=$branch
    git checkout "$1"
    git pull
}

# Push your current branch to remote and add upstream reference
# Usage: push_first_time
function push_first_time() {
    branch=$(git symbolic-ref --short -q HEAD)
    git push --set-upstream origin $branch
}

# Checkout remote branch
# Usage: remote_checkout {branch name}
function remote_checkout(){
    branch=$(git symbolic-ref --short -q HEAD)
    last_branch=$branch
    git fetch
    git checkout "$1"
}

# This will rebase the latest changes from master unto your current branch
# Usage: update_branch_to_master
function update_branch_to_master() {
    branch=$(git symbolic-ref --short -q HEAD)
    git checkout master
    git fetch
    git reset --hard origin/master
    git checkout $branch
    git rebase master
}

# This goes to previous branch after running certain commands.
# Supported commands are `pull_reset_merge_into_dev`, `pull_reset_to`, `checkout_pull`, `remote_checkout`
# Usage: go_to_last
function go_to_last(){
   branch=$(git symbolic-ref --short -q HEAD)
   git checkout "$last_branch"
   last_branch=$branch
}

