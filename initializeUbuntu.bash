# This script is what to use setting up ubuntu.
# Author : Light606F
# Date : 2018-08-07

# How to use
# echo "How to use"
# echo "Command : bash InitializeUbuntu.sh"

# ---vvv---日本語化してあるなら実行する?とこ
# mozc の設定．
# /usr/lib/mozc/mozc_tool -mode=config_dialog
# ---^^^---日本語化してあるなら実行する?とこ

# Update
echo "Apt update and upgrade"
sudo apt update
sudo apt upgrade

# Setting up .bashrc
echo "Bash Setting."
echo -e "\nWorning on bash setting. Maybe, It's just for chromebook crouton."
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
# ''でかこう。ただし内部の'は'"'"'とする。
defaultPS1='PS1='"'"'${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '"'"''
myPS1='PS1='"'"'\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '"'"''

# Replacing for grep and sed. not for fgrep.
defaultPS1=$(echo $defaultPS1 | sed -e "s/\\\\/\\\\\\\\/g" -e "s/\\\$/\\\\\$/g" -e "s/\[/\\\[/g")
myPS1=$(echo $myPS1 | sed -e "s/\\\\/\\\\\\\\/g" -e "s/\\\$/\\\\\$/g" -e "s/\[/\\\[/g")
if [[ `cat $HOME/.bashrc | grep "$defaultPS1"` ]]; then
  # echo "YES"
  mv $HOME/.bashrc $HOME/.bashrcTmp
  sed -e "s/$defaultPS1/$myPS1/g" $HOME/.bashrcTmp > $HOME/.bashrc
  rm $HOME/.bashrcTmp
fi

# For add-apt-repository
# echo "For add-apt-repository"
# ある場合のほうが多い。つまりこのコマンドいらない場合のほうが多い。
# sudo apt install software-properties-common

# Install atom
# echo "Install atom"
# sudo add-apt-repository ppa:webupd8team/atom
# sudo apt update
# sudo apt install atom

# Bashのオートコンプリートがなかったら
# echo "Install bash_completion for auto complete."
# sudo apt install bash-completion
