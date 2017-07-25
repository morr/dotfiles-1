# don't use /etc/zprofile - it might reorder directories in PATH
# https://mattprice.me/2015/zsh-path-issues-osx-el-capitan/
setopt no_global_rcs

#-------------------------------------------------------------------------------
#
# environment variables
#
# export variable if you want programs run from zsh to see it
#
#-------------------------------------------------------------------------------

# removes duplicate entries from PATH
typeset -U path

# NOTE: add /opt/chefdk/bin to PATH in ~/.zlogin
path=(~/scripts /usr/local/bin $path)

# required by `react-native-cli` to be set
export ANDROID_HOME=/usr/local/share/android-sdk
# might be required by `emulator` to be set
#export ANDROID_SDK_ROOT=/usr/local/share/android-sdk
# `android`
path=($path $ANDROID_HOME/tools)
# `sdkmanager` and `avdmanager`
path=($path $ANDROID_HOME/tools/bin)
# `adb`
path=($path $ANDROID_HOME/platform-tools)

# for iterm to display cyrillic
export LANG=en_US.UTF-8
# for mc to display cyrillic
export LC_ALL=en_US.UTF-8

export EDITOR=mvim
export HOMEBREW_GITHUB_API_TOKEN=03adebc410e1f8de5a2765a5f5890ff8beb76d5f

CDPATH=~:~/dev
TERM='xterm-256color'

HISTSIZE=100000
HISTFILESIZE=200000
setopt HIST_IGNORE_DUPS

BLOG=~/blog
DOTFILES=~/.dotfiles
DOWNLOADS=~/Downloads

# projects

ICEPERK=~/dev/complead/iceperk
ICEPERKAPP=~/dev/complead/iceperkapp
ICEPERKCHEF=~/dev/complead/iceperkchef
NEKO_ACHIEVEMENTS=~/dev/morr/neko-achievements
PUMBA=~/dev/ingate/pumba
REENTER_BUILDER=~/dev/ingate/reenter_builder
REENTER_FEED=~/dev/ingate/reenter_feed
SHIKIMORI=~/dev/morr/shikimori

# mount points

OPR7=/Volumes/opr7
PI=/Volumes/pi

#-------------------------------------------------------------------------------
#
# aliases
#
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# cd
#-------------------------------------------------------------------------------

alias blog='cd $BLOG'
alias dot='cd $DOTFILES'
alias dl='cd $DOWNLOADS'

alias ic='cd $ICEPERK'
alias ica='cd $ICEPERKAPP'
alias icc='cd $ICEPERKCHEF'
alias n='cd $NEKO_ACHIEVEMENTS'
alias p='cd $PUMBA'
alias rb='cd $REENTER_BUILDER'
alias rf='cd $REENTER_FEED'
alias s='cd $SHIKIMORI'

alias opr7='cd $OPR7'
alias pi='cd $PI'

#-------------------------------------------------------------------------------
# system
#-------------------------------------------------------------------------------

alias df='df -h'
alias ll='ls -alp'
alias m='mvim'
alias mail='less +G /var/mail/tap'
alias mcu='mc -u'

#-------------------------------------------------------------------------------
# dev
#
# alias definitions are recursive, the order in which they are defined doesn't
# matter - they can still use each other (so called hoisting in JavaScript)
#-------------------------------------------------------------------------------

# elixir

alias iex='iex -S mix'

# git

alias g='git'
alias ga='git add -A .'
alias gc='noglob git_commit'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git_log'
alias gp='git push'
alias gs='git status'
alias gbd='git_branches_delete'

# rails

alias log='tail -f log/development.log'

alias r='rails'
alias rc='rails console'
alias rd='rails dbconsole'
alias rs='rails server'

alias create_user='rake db:create_user && RAILS_ENV=test rake db:create_user'
alias create='rake db:create && RAILS_ENV=test rake db:create'
alias schema_load='rake db:schema:load && RAILS_ENV=test rake db:schema:load'
alias migrate='rake db:migrate && RAILS_ENV=test rake db:migrate'
alias rollback='rake db:rollback && RAILS_ENV=test rake db:rollback'
alias drop='rake db:drop && RAILS_ENV=test rake db:drop'
alias recreate='rake db:recreate && RAILS_ENV=test rake db:recreate'

# react native

alias and='react-native run-android'
alias ios='react-native run-ios'
alias ios5="react-native run-ios --simulator 'iPhone 5'"
alias logios='react-native log-ios'
alias logand='react-native log-android'

# emulator alias below is used
alias avd='emulator -avd Nexus_5X_API_23_x86_64 -gpu host -skin 1080x1920'
alias emulator='cd $ANDROID_HOME/emulator && ./emulator'

# ruby, gems

alias cap='bundle exec cap'
alias guard='bundle exec guard'
alias sidekiq='bundle exec sidekiq --config ./config/sidekiq.yml'

# shikimori

alias git-sub-up="git submodule foreach 'git fetch origin --tags; git checkout master; git pull' && git pull && git submodule update --init --recursive"
alias shikisync=sync_shikimori_images

# SSH
#
# it's to possible to SSH in 2 ways:
#
# 1) ssh <host from .ssh/config>
# 2) ssh <username>@<IP or domain>
#
# in the 1st case user is supplied from .ssh/config
#
# in both cases public key (default one or the one specified in SSH config
# record) is used to authenticate user if it has been previously added to
# .ssh/authorized_keys on server
#
# in case user is not authorized (supplied public key is not present in
# .ssh/authorized_keys on server) SSH fallbacks to password-based authentication

#-------------------------------------------------------------------------------
#
# rbenv initialization (invoke after setting PATH)
#
#-------------------------------------------------------------------------------

eval "$(rbenv init -)"

#-------------------------------------------------------------------------------
#
# functions
#
#-------------------------------------------------------------------------------

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

# https://unix.stackexchange.com/questions/274257
git_commit() {
  [[ -z $1 ]] && echo error: specify git commit message && return 1
  git commit -m "$*"
}

git_branches_delete() {
  git branch | grep -v -E '(master|develop)' | xargs git branch -d
}

git_log() {
  local format='%Cred%h%Creset %C(yellow)%d%Creset %s - %C(bold blue)%an%Creset, %Cgreen%cr'
  git log --graph --pretty=format:${format} --abbrev-commit
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
