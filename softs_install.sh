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
sudo xcodebuild -license

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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

#brew install --cask google-chrome
#brew install --cask mozilla-firefox
#brew install --cask vivaldi

# brew install --cask vagrant
# brew install --cask virtualbox
brew install --cask visual-studio-code

# quickLook plugin all
brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json webpquicklook suspicious-package quicklookase qlvideo


# Ansible用アプリケーションインストール先パス指定
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Ansibleを実行
ansible-playbook -i hosts ansible_playbook/localhost.yml

# ansible caskにないものをmas経由で
brew install mas

mas install 540348655 #Monostnap
mas install 417375580 #BetterSnapTool

mas install 803453959 #Slack
mas install 1024640650 #CotEditor
mas install 414855915 #WinArchiver Lite
mas install 409183694 #Keynote
mas install 443773246 #Rename It
mas install 493949693 #iMage Tools
mas install 466314666 #Don't Sleep
mas install 407963104 #Pixelmator
mas install 880001334 #Reeder

# その他手動で入れるアプリ
# iterm2
# alfred
# commanderOne / mac app store
# cd to
# docker
# filezilla
# keka
# onyx