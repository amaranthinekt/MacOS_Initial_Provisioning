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


