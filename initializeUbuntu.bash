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
read -p "Hit enter: "
/usr/lib/mozc/mozc_tool -mode=config_dialog
# ---^^^---日本語化してあるなら実行する?とこ

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

# Install atom
echo "Install atom"
while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) bash installAtom.bash; break;;
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
