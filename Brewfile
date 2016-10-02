# https://github.com/Homebrew/homebrew-bundle

# - some cask packages and App Store applications ask for password
# - see comments before package or application for postinstallation setup
# - see `brew services` on how to manage services for supported forumalae

cask_args appdir: '/Applications'

tap 'caskroom/cask'
tap 'caskroom/versions'
tap 'homebrew/bundle'
tap 'homebrew/services'
tap 'homebrew/versions'

#brew 'chromedriver'
#brew 'djview4'
#brew 'phantomjs'

brew 'elixir'
# required by ~/scripts/fontpatcher
brew 'fontforge'
brew 'git'
brew 'gpg'
brew 'htop'
brew 'imagemagick'
# - configure rbenv
# - copy fonts from dotfiles
# - ~/.vim/update_bundles
brew 'macvim'
brew 'mas'
brew 'memcached', restart_service: :changed
brew 'mc'
brew 'mpv'
brew 'postgresql', restart_service: :changed
# it's much easier to install pow manually:
# - curl get.pow.cx | sh
# - ln -s ~/dev/reenter_builder ~/.pow
#brew 'pow'
# http://tap349.github.io/rbenv/ruby/chef/capistrano/2016/03/30/rbenv/
brew 'rbenv'
brew 'rbenv-ctags'
brew 'redis', restart_service: :changed
brew 'ssh-copy-id'
brew 'the_silver_searcher'
brew 'tree'
brew 'unrar'
brew 'wget'
# - make it a login shell: chsh -s /bin/zsh
#   (all available shells are listed in /etc/shells)
# - install oh-my-zsh with plugins:
#   - https://github.com/zsh-users/zsh-autosuggestions#oh-my-zsh
#   - https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
brew 'zsh'

cask 'chefdk'
cask 'flux'
# * system preferences:
#   - Users & Groups -> Login Items (don't hide): remove
# * app preferences:
#   - Settings -> On startup: Continue where you left off
#   - Extensions:
#     - AdBlock
#     - Blank New Tab (Hide in Chrome Menu)
#     - Browsec VPN
#     - Dashlane
#     - Data Saver
#     - Ghostery:
#         - General: don't show purple box
#         - Blocking Options: block all except comments
#     - Google Docs (installed by default)
#     - Google Docs Offline (installed by default)
#     - Google Sheets (installed by default)
#     - Noisli
#     - RSS Subscription Extension (by Google) - optional
#     - uBlock Origin
#     - Viewport Dimensions (Hide in Chrome Menu)
#   - Theme (search on page) -> Black Carbon + silver meta
cask 'google-chrome'
# - copy fonts from dotfiles
#
# * app preferences:
#   - General -> Preferences -> Load preferences from a custom folder or URL:
#     /Users/tap/.dotfiles/.config/iterm2
#     (this directory should contain com.googlecode.iterm2.plist settings file
#     exported using 'Save Current Settings to Folder' button below)
#
# or else copy ~/Library/Preferences/com.googlecode.iterm2.plist -
# in both cases iTerm will be fully configured (restart is required)
#
# see also http://tap349.github.io/iterm/rails/2016/05/03/iTerm/
# (all these settings are already included in exported settings file)
cask 'iterm2'
cask 'skype'
# * system preferences:
#   - Users & Groups -> Login Items (don't hide): add
# * app preferences:
#   - Menubar: Temperature only
cask 'smcfancontrol'
# open /usr/local/Caskroom/utorrent/latest/uTorrent.app
cask 'utorrent'

# link to dropbox account and sync (replace local data)
mas '2Do', id: 477670270
# configure on first run:
# - select ~/Documents folder
#   (Cloud Mail.Ru subfolder will be created automatically)
# - select to start application on system startup
# - select folders to synchronize (books/, videos/, education/)
mas 'Cloud Mail.Ru', id: 893068358
mas 'Dashlane - Password Manager, Secure Digital Wallet', id: 552383089
mas 'Evernote', id: 406056744
# * system preferences:
#   - Security & Privacy -> Privacy -> Accessibility
#   - Users & Groups -> Login Items (hide): add
# * app preferences:
#   - Window Mover:
#     - Move: <S-M> + 1 finger
#     - Resize: <S-M> + 2 finger
#   - Layouts:
#     - Maximize: <S-M-CR>
#   - Preferences:
#     - [ ] Show icon in Dock
mas 'Flexiglass', id: 426410278
mas 'Marked 2', id: 890031187
# * app preferences:
#   - General:
#     - [x] Launch at login
#   - Hotkeys:
#     - Capture area: <M-1>
mas 'Monosnap', id: 540348655
mas 'Pomodoro Timer', id: 872515009
# * system preferences:
#   - Users & Groups -> Login Items (don't hide): add
mas 'VPNAutoConnect', id: 532510878
mas 'Xcode', id: 497799835
# * system preferences:
#   - Users & Groups -> Login Items (don't hide): add
# * app preferences:
#   - Shortcuts:
#     - General -> Show Magnifier: <M-2>
mas 'Sip', id: 507257563
