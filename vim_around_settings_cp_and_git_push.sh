#!/bin/sh

# functions ===============
y_or_n(){
  read answer
  case $answer in
    Y)
      return 0
      ;;
    y)
      return 0
      ;;
    yes)
      return 0
      ;;
    N)
      return 1
      ;;
    no)
      return 1
      ;;
    n)
      return 1
      ;;
    *)
      return 0
      # y_or_n
      ;;
  esac
}
# functions ===============


# ホームディレクトリにdevelopmentがあるかないか
homedir=~/
devdir=development

echo "ホームディレクトリに移動"
cd $homedir
echo "現在のディレクトリ："; pwd

if [ ! -e $homedir$devdir]; then
  echo "developmentフォルダが無いので作成します"
  mkdir development
fi
cd $devdir
echo "現在のディレクトリ："; pwd

# ~/development/MacOS_Initial_Provisioning ディレクトリがあるかないか
# 当該フォルダに.gitがあるかないか
# .gitが無いならgit clone
mydir=MacOS_Initial_Provisioning;
if [ ! -e $mydir ]; then
  if [ ! -e ".git" ]; then
    echo "gitレポジトリが無いのでcloneします。"
    git clone https://github.com/amaranthinekt/MacOS_Initial_Provisioning.git
  fi
fi

echo "gitレポジトリのディレクトリに移動"
cd $mydir
echo "現在のディレクトリ："; pwd

# 実行マシンの.vimrc .gvimrc .vin/ をコピー
echo "このマシンの~/vimrc, ~/.gvimrc, ~/.vim/をgitレポジトリフォルダに上書きします。よろしいですか？(Y/n?)"
y_or_n
if [ -e $answer ]; then
  echo "承認されました。ファイルをコピーしています。"
  cp ~/.vimrc ./_.vimrc
  cp ~/.gvimrc ./_.gvimrc
  cp -r ~/.vim/ ./_.vim

  # git add .
  echo "gitレポジトリへの追加"
  git add .

  # git commit 用のメッセージを入力
  echo "コミットメッセージを入力してください。"
  read commitmsg
  git commit -m "$commitmsg"

  # git push | masterブランチ固定
  echo "push します。masterブランチ固定です。"
  git push origin master

  # 完了メッセージ
  echo "githubへのバックアップが完了しました。"

else
  echo "キャンセルされました。"
  break
fi

