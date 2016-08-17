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
mas install 568494494 #Pocket
mas install 896624060 #kobito
mas install 492068728 #Yummy FTP
mas install 414855915 #WinArchiver Lite
mas install 409183694 #Keynote
mas install 891953906 #Buffer
mas install 443773246 #Rename It
mas install 493949693 #iMage Tools
mas install 409789998 #Twitter
mas install 411246225 #Caffeine
mas install 407963104 #Pixelmator
mas install 880001334 #Reeder
mas install 508957583 #Nozbe
mas install 848311469 #Write
