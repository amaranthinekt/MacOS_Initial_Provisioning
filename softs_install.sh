# 開発環境のインストール =========================
#
# 参考情報
# 
# Mac の開発環境構築を自動化する (2015 年初旬編)
# http://t-wada.hatenablog.jp/entry/mac-provisioning-by-ansible



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

#brew cask install google-chrome
#brew cask install mozilla-firefox
#brew cask install vivaldi

brew cask install vagrant
# brew cask install virtualbox
brew cask install visual-studio-code

# quickLook plugin all
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json webpquicklook suspicious-package quicklookase qlvideo


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
mas install 411246225 #Caffeine
mas install 407963104 #Pixelmator
mas install 880001334 #Reeder

