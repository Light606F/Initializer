# This script is what to use setting up ubuntu.
# Author : Light606F
# Date : 2018-08-07

# How to use
echo "How to use"
echo "Command : bash InitializeUbuntu.sh"
read -p "Hit enter: "

# ホームディレクトリの名前を日本語から英語に
LANG=C xdg-user-dirs-gtk-update

# ---vvv---日本語化してあるなら実行する?とこ
# mozc の設定画面が開く．
echo "Set mozc setting."
echo "モード	入力キー	コマンド
直接入力	Ctrl Space	IMEを有効化
入力文字なし	Ctrl Space	IMEを無効化
変換前入力中	Ctrl Space	IMEを無効化
変換中	Ctrl Space	IMEを無効化"
read -p "Hit enter: "
/usr/lib/mozc/mozc_tool -mode=config_dialog
# ---^^^---日本語化してあるなら実行する?とこ

echo "HHKB使うなら，US配列に変更しないとダメだよ．"
echo "一番上の「キーボード-日本語」を「キーボード-英語(US)」にかえて，下の方でレイアウトをUSに変更．"
read -p "Hit enter: "


# Update
echo "Apt update and upgrade : "
while true; do
  read -p "Do you wish to update and upgrade? y/n" yn
  case $yn in
        [Yy]* ) sudo apt update; sudo apt upgrade;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
  esac
done

# For add-apt-repository
# ある場合のほうが多い。つまりこのコマンドいらない場合のほうが多い。
echo "For add-apt-repository"
# apt show software-properties-common
while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) sudo apt install software-properties-common; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Install VSCode
echo "Install VSCode"
while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) sudo snap install --classic code; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# terminal setting
echo "Terminal setting. Force color prompt?"
while true; do
    read -p "Do you wish to do this?" yn
    case $yn in
        # [Yy]* ) bash installAtom.bash; break;;  # TODO:have to fix it
        [Yy]* ) echo "have to fix it!"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done


# Bashのオートコンプリートがなかったら
echo "Install bash_completion for auto complete."
while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) sudo apt install bash-completion; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
