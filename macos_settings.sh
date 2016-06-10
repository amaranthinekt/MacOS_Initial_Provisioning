## Mac Initial Provisioning Shell Sctipt for settings
##

# 手動でOSアップデートが必要か。


# 以下、設定 =========================

## 参考情報
#
# ターミナルから Mac を設定する（defaults write コマンド等）
# http://qiita.com/djmonta/items/17531dde1e82d9786816
#
# ばかもりだし
# http://baqamore.hatenablog.com/archive/category/macos



# Finderの設定変更 =====================

# 隠しファイルの表示
# defaults write com.apple.finder AppleShowAllFiles true

# Show Status bar in Finder （ステータスバーを表示）
defaults write com.apple.finder ShowStatusBar -bool true

# Show Path bar in Finder （パスバーを表示）
defaults write com.apple.finder ShowPathbar -bool true

# Show the ~/Library directory （ライブラリディレクトリを表示、デフォルトは非表示）
# chflags nohidden ~/Library #効かない

# すべてのファイルの拡張子を表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true


# Finderの再起動
killall Finder



# Dockの設定変更 =====================

# Dock に標準で入っている全てのアプリを消す、Finder とごみ箱は消えない）
defaults write com.apple.dock persistent-apps -array

# Set the icon size （アイコンサイズの設定）
defaults write com.apple.dock tilesize -int 30

# Magnificate the Dock （Dock の拡大機能を入にする）
defaults write com.apple.dock magnification -bool true

# Set Dock orientation to left
defaults write com.apple.dock orientation -string “left”


# Bottom left screen corner → Mission Control （左下 → Mission Control）
defaults write com.apple.dock wvous-bl-corner -int 2
defaults write com.apple.dock wvous-bl-modifier -int 0

# Bottom right screen corner → Show application windows （右下 → デスクトップを表示）
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0


# Allow you to select and copy string in QuickLook （QuickLook で文字の選択、コピーを出来るようにする）
# defaults write com.apple.finder QLEnableTextSelection -bool true #効かない

# Enable `Tap to click` （タップでクリックを有効にする）
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Save screenshots as PNGs （スクリーンショット保存形式をPNGにする）
defaults write com.apple.screencapture type -string "png"

# Avoid creating `.DS_Store` files on network volumes （ネットワークディスクで、`.DS_Store` ファイルを作らない）
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Hide the battery percentage from the menu bar （バッテリーのパーセントを表示にする）
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Date options: Show the day of the week: on （日付表示設定、曜日を表示）
defaults write com.apple.menuextra.clock 'DateFormat' -string 'yyyy/MM/dd HH:mm'

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# ライブ変換をオフにします
defaults write com.apple.inputmethod.Kotoeri 'JIMPrefLiveConversionKey' -bool false
killall -HUP JapaneseIM

# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# key repeat delay
defaults write -g InitialKeyRepeat -int 15

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# 2. [システム環境設定]，[キーボード] の pnl[キーボード] > chb[F1、F2 などのすべてのキーを標準ファンクションキーとして使用] = "オン"
defaults write -g com.apple.keyboard.fnState -bool true

# 3. [システム環境設定]，[キーボード] の pnl[キーボードショートカット] > [フルキーボードアクセス : Tab キーを押してウィンドウやダイアログ内の操作対象を移動する機能の適用範囲] = rbt[すべてのコントロール]
defaults write -g AppleKeyboardUIMode -int 3




# Safari ==================

# Enable the `Develop` menu and the `Web Inspector` （開発メニューを表示）
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true


# Show the full URL in the address bar (note: this will still hide the scheme)
# アドレスバーに完全なURLを表示
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true


# Add a context menu item for showing the `Web Inspector` in web views
# コンテキストメニューにWebインスペクタを追加
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Show Safari's Status Bar （ステータスバーを表示）
defaults write com.apple.Safari ShowStatusBar -bool true


# Terminal Theme 設定 ==================
# Use a custom theme （カスタムテーマを使う、そのテーマをデフォルトに設定する）
# 本スクリプトと同ディレクトリにある Terminal_Profile_Basic_Customized.terminal を読み込む
TERM_PROFILE='Terminal_Profile_Basic_Customized';
TERM_PATH='./';
CURRENT_PROFILE="$(defaults read com.apple.terminal 'Default Window Settings')";
if [ "${CURRENT_PROFILE}" != "${TERM_PROFILE}" ]; then
    open "$TERM_PATH$TERM_PROFILE.terminal"
    defaults write com.apple.Terminal "Default Window Settings" -string "$TERM_PROFILE"
    defaults write com.apple.Terminal "Startup Window Settings" -string "$TERM_PROFILE"
fi
defaults import com.apple.Terminal "$HOME/Library/Preferences/com.apple.Terminal.plist"


# Firewall =======================
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# vimrc copy =======================
cp ./_.vimrc ~/.vimrc
cp -r ./_.vim ~/.vim

# ログアウト or 再起動が必要 ===========================================
sudo reboot


