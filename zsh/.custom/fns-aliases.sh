mkcd() {
    mkdir -p "$1" && cd "$1";
}

alias sa="source ~/.zshrc"
alias se="code ~/.zshrc"

#################
# Git aliases
#################

alias gcl='git clone'
alias ga='git add'
alias grm='git rm'
alias gap='git add -p'
alias gall='git add -A'
alias gf='git fetch --all --prune'
alias gft='git fetch --all --prune --tags'
alias gfv='git fetch --all --prune --verbose'
alias gftv='git fetch --all --prune --tags --verbose'
alias gus='git reset HEAD'
alias gpristine='git reset --hard && git clean -dfx'
alias gclean='git clean -fd'
alias gm="git merge"
alias gmv='git mv'
alias g='git'
alias get='git'
alias gs='git status'
alias gss='git status -s'
alias gsu='git submodule update --init --recursive'
alias gl='git pull'
alias glum='git pull upstream master'
alias gpr='git pull --rebase'
alias gpp='git pull && git push'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gpo='git push origin HEAD'
alias gpu='git push --set-upstream'
alias gpuo='git push --set-upstream origin'
alias gpuoc='git push --set-upstream origin $(git symbolic-ref --short HEAD)'
alias gpom='git push origin master'
alias gr='git remote'
alias grv='git remote -v'
alias gra='git remote add'
alias grb='git rebase'
alias grm='git rebase master'
alias grmi='git rebase master -i'
alias gd='git diff'
alias gds='git diff --staged'
alias gdt='git difftool'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcm='git commit -v -m'
alias gcam="git commit -v -am"
alias gci='git commit --interactive'
alias gcamd='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias gb='git branch'
alias gba='git branch -a'
alias gbt='git branch --track'
alias gbm='git branch -m'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcpx='git cherry-pick -x'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcb='git checkout -b'
alias gcob='git checkout -b'
alias gct='git checkout --track'
alias gcpd='git checkout master; git pull; git branch -D'
alias gexport='git archive --format zip --output'
alias gdel='git branch -D'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias gg="git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative"
alias ggs="gg --stat"
alias gsh="git show"
alias gsl="git shortlog -sn"
alias gwc="git whatchanged"
alias gt="git tag"
alias gta="git tag -a"
alias gtd="git tag -d"
alias gtl="git tag -l"
alias gpatch="git format-patch -1"
# From http://blogs.atlassian.com/2014/10/advanced-git-aliases/
# Show commits since last pull
alias gnew="git log HEAD@{1}..HEAD@{0}"
# Add uncommitted and unstaged changes to the last commit
alias gcaa="git commit -a --amend -C HEAD"
# Rebase with latest remote master
alias gprom="git fetch origin master && git rebase origin/master && git update-ref refs/heads/master origin/master"
alias gpunch="git push --force-with-lease"
alias ggui="git gui"
alias gcsam="git commit -S -am"
# Stash aliases
alias gst="git stash"
alias gstb="git stash branch"
alias gstd="git stash drop"
alias gstl="git stash list"
# Push introduced in git v2.13.2
alias gstpu="git stash push"
alias gstpum="git stash push -m"
# Save deprecated since git v2.16.0
# - aliases now resolve to push
alias gsts="git stash push"
alias gstsm="git stash push -m"
# Alias gstpo added for symmetry with gstpu (push)
# - gstp remains as alias for pop due to long-standing usage
alias gstpo="git stash pop"
alias gstp="git stash pop"
# Switch aliases - Requires git v2.23+
alias gsw="git switch"
alias gswm="git switch master"
alias gswc="git switch --create"
alias gswt="git switch --track"
# Git home
alias ghm='cd "$(git rev-parse --show-toplevel)"'
# Show untracked files
alias gu='git ls-files . --exclude-standard --others'

case $OSTYPE in
  darwin*)
    alias gtls="git tag -l | gsort -V"
    ;;
  *)
    alias gtls='git tag -l | sort -V'
    ;;
esac

####################
# nvm aliases
####################

alias n8="nvm use lts/carbon"
alias n10="nvm use lts/dubnium"
alias n12="nvm use lts/erbium"

####################
# hub aliases
####################

alias hs="hub sync"
alias hpro="hub pr show"
alias hprn="hub pull-request --no-edit -p -b"
alias hprnd="hub pull-request --draft --no-edit -p -b"

###################
# yarn aliases
###################

alias ys="yarn start"
alias yb="yarn build"
alias ya="yarn add"
alias yda="yarn add -D"
alias yga="yarn global add"
alias yrm="yarn remove"
alias ygrm="yarn global remove"

###################
# npm aliases
###################

alias ni="npm install"
alias ndi="npm install -D"
alias nb="npm run build"
alias ngi="npm install -g"
alias ns="npm start"
alias nu="npm uninstall"
alias ngu="npm uninstall -g"

##########################
# Directory shortcuts
##########################

alias work="cd ~/work"
alias dev="cd ~/dev"

alias p=pnpm

########################
# Tooling aliases
# ######################

alias cat='bat'
alias ls='eza'

alias codego='code --profile=Golang'
alias coders='code --profile=Rust'
alias coderust='code --profile=Rust'
alias codepy='code --profile=Python'
alias coderb='code --profile=Ruby'
alias codecpp='code --profile=CPP'
alias codeex='code --profile=Elixir'

alias vscode="$(which code)"
function code() {
  curr_pwd="$PWD"
  if [[ -d "$1" ]]; then 
    cd "$1"
  fi

  if [[ -e "go.mod" || -n `find . -type f -iname '*.go'` ]]; then
    cd "$curr_pwd"
    vscode --profile="Golang" "$@"
  elif [[ -e "Cargo.toml" || -n `find . -type f -iname '*.rs'` ]]; then
    cd "$curr_pwd"
    vscode --profile="Rust" "$@"
  elif [[ -e "requirements.txt" || -e "pyproject.toml" || -e "poetry.lock" || -e "Pipfile.lock" || -n `find . -type f -iname '*.py'` ]]; then
    cd "$curr_pwd"
    vscode --profile="Python" "$@"
  elif [[ -e "Gemfile" || -e "Gemfile.lock" || -n `find . -type f -iname '*.rb'` ]]; then
    cd "$curr_pwd"
    vscode --profile="Ruby" "$@"
  elif [[ -n `find . -type f \( -iname '*.c' -o -iname '*.cpp' -o -iname '*.cc' \)` ]]; then
    cd "$curr_pwd"
    vscode --profile="CPP" "$@"
  elif [[ -n `find . -type f -iname '*.ex'` ]]; then
    cd "$curr_pwd"
    vscode --profile="Elixir" "$@"
  else
    cd "$curr_pwd"
    vscode --profile="Default" "$@"
  fi
}

function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

