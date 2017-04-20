# https://github.com/Homebrew/homebrew-bundle

# - some cask packages and App Store applications ask for password
# - see comments before package or application for postinstallation setup
# - see `brew services` on how to manage services for supported forumalae

cask_args appdir: '/Applications'

# remove formula with its unused dependencies:
# `brew rmtree mpv`
tap 'beeftornado/rmtree'
tap 'caskroom/cask'
tap 'homebrew/bundle'
tap 'homebrew/services'

#brew 'chromedriver'
#brew 'djview4'

# run `aws configure` after installation
brew 'awscli'
# for cpsm vim plugin
brew 'cmake'
# for cpsm vim plugin
brew 'boost'
brew 'elixir'
# required by ~/scripts/fontpatcher
brew 'fontforge'
brew 'git'
brew 'gpg'
brew 'htop'
brew 'imagemagick'
# used as viewer for html files in mc
brew 'lynx'
# - install vim-plug:
#   `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
# - install plugins:
#   :PlugInstall
#
# - app preferences:
#   - General:
#     - After last window closes: Quit MacVim
#   - Advanced:
#     - [ ] Draw marked text inline
brew 'macvim'
brew 'mas'
brew 'memcached', restart_service: :changed
brew 'mc'
brew 'mpv'
# for reenter_feed
brew 'nodejs'
brew 'p7zip'
brew 'phantomjs'
# https://github.com/Homebrew/brew/blob/master/docs/Versions.md
brew 'postgresql@9.5', restart_service: :changed
# - it's much easier to install pow manually:
#   `curl get.pow.cx | sh`
# - create symlinks for all required projects:
#   `ln -s ~/dev/reenter_builder ~/.pow`
#brew 'pow'
# http://tap349.github.io/rbenv/ruby/chef/capistrano/2016/03/30/rbenv
brew 'rbenv'
brew 'rbenv-ctags'
brew 'redis', restart_service: :changed
brew 'ssh-copy-id'
brew 'the_silver_searcher'
brew 'tree'
brew 'unrar'
brew 'wget'
# - make it a login shell: `chsh -s /bin/zsh`
#   (all available shells are listed in /etc/shells,
#   current shell can be printed with `echo $0` command)
# - install oh-my-zsh:
#   - https://github.com/robbyrussell/oh-my-zsh#via-curl
# - install oh-my-zsh plugins:
#   - https://github.com/zsh-users/zsh-autosuggestions#oh-my-zsh
#   - https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
brew 'zsh'

# for Raspeberry Pi
cask 'applepi-baker'
cask 'calibre'
cask 'chefdk'
# run docker app after installation
# (otherwise `docker` command might be not available in terminal)
cask 'docker'
# - system preferences:
#   - Users & Groups -> Login Items (hide): add
# - app preferences:
#   - 'Working late' preset
#   - [x] Start f.lux at login (set by default)
cask 'flux'
# app preferences (bookmarks bar, extensions, etc.) are synchronized
# if you sign in to Chrome (my email is a***.t***.i***@gmail.com)
#
# on first run:
#  - [x] Set Google Chrome as your default browser
#  - [ ] Help make Google Chrome better by automatically sending usage
#        statistics and crash reports to Google
#  - Sign in to Chrome (page is opened automatically)
#
# - system preferences:
#   - Users & Groups -> Login Items (don't hide): remove
# - app preferences:
#   - Settings -> On startup: Continue where you left off
#   - Extensions (allow all of them in incognito):
#     + AdBlock
#     + Blank New Tab (Hide in Chrome Menu)
#     + Browsec VPN
#     + Clouder (Hide in Chrome Menu)
#     + Dashlane (not available in webstore - can be added on first Dashlane run)
#     - Data Saver (turn off - turned on after installation)
#     + Ghostery:
#       - General:
#         - [ ] Show the purple box in the corner of my browser
#       - Blocking Options:
#         - Block All (except Comments)
#     + Google Docs (installed by default)
#     + Google Docs Offline (installed by default)
#     + Google Sheets (installed by default)
#     - Google Slides (installed by default)
#     + GoUniverse
#     + JSON Formatter (Hide in Chrome Menu)
#     + Noisli
#     - Proxy SwitchyOmega (configure proxy per site)
#     + Quick Javascript Switcher
#     - RSS Subscription Extension (by Google) - optional
#     + Tag Assistant (by Google) (enabled per tab)
#     + The Great Suspender
#     + Viewport Dimensions (Hide in Chrome Menu)
#     + uBlock Origin
#   - Theme (search on page) -> Black Carbon + silver meta
#   - chrome://plugins:
#     - disable Adobe Flash Player
# - bookmarks bar:
#   - pin! (https://pinboard.in/howto/)
# - developer tools:
#   - Dock to bottom
cask 'google-chrome'
# - app preferences:
#   - General -> Preferences:
#     - [x] Load preferences from a custom folder or URL:
#       /Users/tap/.dotfiles/.config/iterm2/
#       (this directory should contain com.googlecode.iterm2.plist settings file
#       exported using 'Save Current Settings to Folder' button below).
#       or else copy ~/Library/Preferences/com.googlecode.iterm2.plist -
#       in both cases iTerm will be fully configured (restart is required)
#     - [x] Save changes to folder when iTerm2 quits
#
# see also http://tap349.github.io/iterm/rails/2016/05/03/iTerm/
# (all these settings are already included in exported settings file)
cask 'iterm2'
# - system preferences:
#   - Users & Groups -> Login Items: remove
cask 'keybase'
cask 'openemu'
cask 'pgadmin4'
cask 'skype'
# - app preferences:
#   - Menubar: Temperature only
#   - [x] Check for updates on startup
#   - [x] Autostart smcFanControl after login
cask 'smcfancontrol'
cask 'unetbootin'
# - `open /usr/local/Caskroom/utorrent/latest/uTorrent.app`
# - system preferences:
#   - Users & Groups -> Login Items (don't hide): remove
cask 'utorrent'

# - link to dropbox account and sync (Replace Local Data)
# - app preferences:
#   - General:
#     - Quick Entry: <C-S-a>
#   - Sync:
#     - Setup:
#       - Link Dropbox Account
mas '2Do', id: 477670270
# on first run:
# - select ~/Documents folder
#   (Cloud Mail.Ru subfolder will be created automatically)
# - select to start application on system startup
# - select folders to synchronize (books/, videos/, education/)
mas 'Cloud Mail.Ru', id: 893068358
# to add Safari extension first open Dashlane, then Safari -
# you'll be prompted to install Dashlane extension
mas 'Dashlane - Password Manager, Secure Digital Wallet', id: 552383089
mas 'Evernote', id: 406056744
# - on first run agree to start Flexiglass every time systems starts
#
# - system preferences:
#   - Security & Privacy -> Privacy -> Accessibility
# - app preferences:
#   - Window Mover:
#     - Move: <S-M> + one finger (+ Left Mouse Button for mouse)
#     - Resize: <S-M> + two fingers (+ Right Mouse Button for mouse)
#   - Layouts:
#     - Maximize: <S-M-CR>
#   - Preferences:
#     - [ ] Show icon in Dock
mas 'Flexiglass', id: 426410278
mas 'Marked 2', id: 890031187
mas 'Microsoft Remote Desktop', id: 715768417
# - app preferences:
#   - General:
#     - After upload:
#       - [ ] Open in browser
#     - [x] Launch at login
#   - Hotkeys:
#     - Capture area: <M-1>
#   - Account (to be able to upload screenshots):
#     - Login -> Login with Facebook (a***.t***.i***@gmail.com)
mas 'Monosnap', id: 540348655
mas 'Pomodoro Timer', id: 872515009
# - system preferences:
#   - Users & Groups -> Login Items (don't hide): add
mas 'VPNAutoConnect', id: 532510878
mas 'Xcode', id: 497799835
# - system preferences:
#   - Users & Groups -> Login Items (don't hide): add
# - app preferences:
#   - Shortcuts:
#     - General -> Show Magnifier: <M-2>
mas 'Sip', id: 507257563
mas 'Telegram Desktop', id: 946399090
