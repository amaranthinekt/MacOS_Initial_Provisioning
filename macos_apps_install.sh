#!/bin/sh

#set -eu

# 開発環境のインストール =========================
#
# 参考情報
#
# Mac の開発環境構築を自動化する (2015 年初旬編)
# http://t-wada.hatenablog.jp/entry/mac-provisioning-by-ansible

# 注記
echo "本スクリプトは、Xcode、HomeBrew、Python、ansibleをインストールします。"
echo "また、brew caskおよびmas-cliを用いて、さまざまなアプリをインストールします。"
echo ""
echo "なお、mas-cliを用いて、Mac App Store経由でインストールする際には、すでにMac App Storeにログインしていることが必要です。"
echo "一度も開いていない場合には、ログインしていない可能性があるので、一度開いてから本スクリプトを実行してください。"
echo ""
echo "続行しますか？（Yで進む）"

read answer

case $answer in
    Y)
        echo "処理を続けます。"
        ;;
    *)
        echo "Yが入力されませんでしたので、処理を終了します。"
        exit
        ;;
esac


# xcode
#xcode-select --install
#sudo xcodebuild -license

# Homebrew
#ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/amaranthine/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew Update
brew update

# Python install - MacデフォルトのPythonだとAnsibleの動作要件たる2.4以上でない可能性がある
brew install python

# Ansible install
brew install ansible

# brew cask
#自動化厨の自分がhomebrew-caskを使わなくなった理由 : Query OK.
#https://queryok.ikuwow.com/entry/stop-brew-cask/

# コメントアウトしているものは手動インストールの方が良いと判断したもの

brew install google-chrome
brew install firefox
brew install vivaldi
# brew install vagrant
# brew install virtualbox
brew install visual-studio-code
brew install alfred
brew install iterm2
brew install adobe-reader
brew install vlc
brew install imageoptim
brew install keka
brew install docker
brew install docker-compose
brew install virtualbox
brew install bitwarden
brew install bettertouchtool
brew install onyx
brew install cd-to

# quickLook plugin all
brew install qlcolorcode qlstephen qlmarkdown quicklook-json webpquicklook suspicious-package quicklookase

brew install phpstorm
brew install rubymine

# いろいろmas経由で
brew install mas

mas install 540348655 #Monostnap
#mas install 417375580 #BetterSnapTool

mas install 803453959 #Slack
mas install 1024640650 #CotEditor
mas install 414855915 #WinArchiver Lite
mas install 409183694 #Keynote
mas install 443773246 #Rename It
mas install 493949693 #iMage Tools
mas install 466314666 #Don't Sleep
mas install 407963104 #Pixelmator
mas install 880001334 #Reeder
mas install 1035236694 # commanderOne

# font ricty powerline
brew tap sanemat/font
brew install ricty --with-powerline
cp -f /opt/homebrew/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

# font nerdfont
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font

# on rosetta は、最後に
echo "Apple Silicon（M1/M2など）搭載のMacマシンですか？（Y/n）"
read IS_APPLE_SILICON
if [ "$IS_APPLE_SILICON" != "n" ]; then
  sudo softwareupdate --install-rosetta
fi
brew install google-japanese-ime
brew install qlvideo

# 手動対応
echo ""
echo "※現在、下記の手動対応が必要です。"
echo " - iTerm2 の設定でフォントを Ricty Powerline に変更"
echo " - FileZila の手動インストール（brew install できない）"
echo " - IMEをGoogle日本語入力に切り替え"
echo " - 各種アプリケーションの初期設定（アプリケーションフォルダでとりあえず全部一回起動する）"
echo " - 起動時の「じゃーん♪」を消すには、設定⇨サウンド→起動時にサウンドを再生をオフ"
echo " - "

# 再起動
echo ""
echo "上記が終わったら、再起動してください。再起動しますか？（y/N）"
read IS_REBOOT
if [ "$IS_REBOOT" = "y" ]; then
    sudo reboot
else
    echo "処理を終了します。手動で再起動してください。"
fi
