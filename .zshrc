#-----------------------------------------------------------------------------------------
# set to this to use case-sensitive completion
#-----------------------------------------------------------------------------------------

CASE_SENSITIVE='true'

#-----------------------------------------------------------------------------------------
# uncomment following line if you want red dots to be displayed while waiting for completion
#-----------------------------------------------------------------------------------------

# NOTE don't use along with zsh-autosuggestions!
COMPLETION_WAITING_DOTS='false'

#-----------------------------------------------------------------------------------------
# uncomment following line if you want to show in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
#-----------------------------------------------------------------------------------------

HIST_STAMPS='yyyy-mm-dd'

#=========================================================================================
#
# oh-my-zsh
#
#=========================================================================================

#-----------------------------------------------------------------------------------------
# themes: ~/.oh-my-zsh/themes/
# theme previews can be found at https://github.com/robbyrussell/oh-my-zsh/wiki/themes
#-----------------------------------------------------------------------------------------

ZSH_THEME='tap-af-magic'

#-----------------------------------------------------------------------------------------
# plugins: ~/.oh-my-zsh/plugins/*
# custom plugins: ~/.oh-my-zsh/custom/plugins/
#-----------------------------------------------------------------------------------------

# https://github.com/rails/spring/tree/v0.0.9#usage
UNBUNDLED_COMMANDS=(spring)
plugins=(ssh-agent)

#-----------------------------------------------------------------------------------------
# source oh-my-zsh.sh after all configuration is done
#-----------------------------------------------------------------------------------------

ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

#=========================================================================================
#
# standalone plugins
#
#=========================================================================================

#-----------------------------------------------------------------------------------------
# zsh-autosuggestions
#-----------------------------------------------------------------------------------------

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/autosuggestions.zsh

zle-line-init() {
    zle autosuggest-start
}

zle -N zle-line-init

#=========================================================================================
#
# user configuration
#
#=========================================================================================

#-----------------------------------------------------------------------------------------
#
# startup
#
#-----------------------------------------------------------------------------------------

eval "$(rbenv init -)"
#source ~/.iterm2_shell_integration.zsh

#-----------------------------------------------------------------------------------------
#
# environment variables
#
# export variable if you want programs run from zsh to see it
#
#-----------------------------------------------------------------------------------------

export EDITOR=mvim

CDPATH=~:~/dev
TERM="xterm-256color"

HISTSIZE=100000
HISTFILESIZE=200000
setopt HIST_IGNORE_DUPS

BLOG=~/blog

CDN_REENTER=~/dev/cdn_reenter
CHEF=~/dev/chef
CHEFUPTIMUS=~/dev/chefuptimus
NALA=~/dev/nala
PUMBA=~/dev/pumba
SHIKIMORI=~/dev/shikimori
SIBAS=~/dev/sibas
UMKA=~/dev/umka
UPTIMUS=~/dev/uptimus

#-----------------------------------------------------------------------------------------
#
# aliases
#
#-----------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------
# cd
#-----------------------------------------------------------------------------------------

alias blog='cd $BLOG'
alias dl='cd ~/Downloads'
alias dot='cd ~/.dotfiles'

alias c='cd $CHEF'
alias cdn='cd $CDN_REENTER'
alias cu='cd $CHEFUPTIMUS'
alias n='cd $NALA'
alias p='cd $PUMBA'
alias s='cd $SHIKIMORI'
alias um='cd $UMKA'
alias up='cd $UPTIMUS'

#-----------------------------------------------------------------------------------------
# system
#-----------------------------------------------------------------------------------------

alias df='df -h'
alias ll='ls -alp'
alias mail='less +G /var/mail/tap'

#-----------------------------------------------------------------------------------------
# dev
#-----------------------------------------------------------------------------------------

# rails, rake, rspec

alias rails='bin/rails'
alias rake='bin/rake'
alias rspec='bin/rspec'

alias r='bin/rails'
alias rc='bin/rails console'
alias rd='bin/rails dbconsole'
alias rs='bin/rails server'

alias migrate='bin/rake db:migrate && RAILS_ENV=test bin/rake db:migrate'
alias rollback='bin/rake db:rollback && RAILS_ENV=test bin/rake db:rollback'

# other gems

alias cap='bundle exec cap'
alias guard='bundle exec guard'
alias sidekiq='bundle exec sidekiq --config ./config/sidekiq.yml'

# git

alias g='git'
alias ga='git add -A .'
alias gc='git_commit'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %C(yellow)%d%Creset %s - %C(bold blue)%an%Creset, %Cgreen%cr' --abbrev-commit"
alias gs='git status'
alias gbd='git_delete_branches'

# misc

alias css_to_sass='sass-convert --from css --to sass -R'
alias log='tail -f log/development.log'

# shikimori

alias git-sub-up="git submodule foreach 'git fetch origin --tags; git checkout master; git pull' && git pull && git submodule update --init --recursive"
alias hetzner='ssh devops@78.46.50.20'
alias shikisync=sync_shikimori_images

# SSH
#
# it's to possible to SSH in 2 ways:
#
# 1) ssh <host from .ssh/config>
# 2) ssh <username>@<host from /etc/hosts>
#
# in the 1st case user is supplied from .ssh/config
#
# in both cases public key for matching host is used to authenticate
# if it has been added to .ssh/authorized_keys on server for specified user
#
# in case matching host can't be found in .ssh/config ssh fallbacks
# to password-based authentication (e.g. when using IP or alternative domain)

#-----------------------------------------------------------------------------------------
#
# functions
#
#-----------------------------------------------------------------------------------------

f() {
  find . -type f \
    \( -name "*.rb" -or -name "*.erb" -or -name "*.rss" -or -name "*.xml" -or -name "*.slim" -or -name "*.haml" -or \
       -name "*.html" -or -name "*.js" -or -name "*.coffee" -or -name "*.ejs" -or -name "*.jst" -or -name "*.eco" -or \
       -name "*.css" -or -name "*.scss" -or -name "*.sass" -or -name "*.yml" -or -name "*.vim" -or -name "*.rabl" -or \
       -name "*.builder"  -or -name "*.txt" \) \
    -exec grep -l "$*" {} \;
}

fvim() {
  mvim `f "$*"`
}

gr() {
  fgrep --color --exclude-dir={log,public,tmp,.git} -Iir "$@" .
}

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]]; then source "$HOME/.hitch_export_authors" ; fi
}

# blog

post() {
  noglob rake "post:create[$*]"
}

publish() {
  git add -A .
  git commit -m "update `date +%Y-%m-%d_%H:%M:%S`"
  git push
}

# git

git_commit() {
  [[ -z $1 ]] && echo error: specify git commit message && return 1
  git commit -m "$*"
}

git_delete_branches() {
  git branch | grep -v -E '(master|develop)' | xargs git branch -d
}

# shikimori

sync_shikimori_images() {
  local local_path=~/shikimori.org/images/
  local shiki_path=/home/apps/shikimori/production/shared/public/images/

  for dir in $(ssh devops@78.46.50.20 ls $shiki_path)
  do
    if [[ "$dir" == "image" || "$dir" == "user_image" || "$dir" == "screenshot" || "$dir" == "cosplay_image" || "$dir" == "webm_video" ]]; then
      echo "skipping $dir"
      continue
    else
      echo "processing $dir ..."
      rsync -urv -e ssh devops@78.46.50.20:$shiki_path$dir $local_path
    fi
  done
}
