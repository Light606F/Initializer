# This script is what to use setting up ubuntu.
# Author : Light606F
# Date : 2018-08-07

# How to use
echo "How to use"
echo "Command : bash InitializeUbuntu.sh"
read -p "Hit enter: "

# ---vvv---日本語化してあるなら実行する?とこ
# mozc の設定画面が開く．
echo "Set mozc setting."
read -p "Hit enter: "
/usr/lib/mozc/mozc_tool -mode=config_dialog
# ---^^^---日本語化してあるなら実行する?とこ

# Update
echo "Apt update and upgrade"
read -p "Hit enter: "
sudo apt update
sudo apt upgrade


# Setting up .bashrc
echo "Bash Setting."
echo -e "\tWORNING on bash setting. Maybe, It's just for chromebook crouton."
read -p "Hit enter: "

# enable force_color_prompt
if [[ `cat $HOME/.bashrc | grep '#force_color_prompt=yes'` ]]; then
  before='#force_color_prompt=yes'
  after='force_color_prompt=yes'
  mv $HOME/.bashrc $HOME/.bashrcTmp
  sed -e "s/$before/$after/g" $HOME/.bashrcTmp > $HOME/.bashrc
  rm $HOME/.bashrcTmp
fi

# Preparetion
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
echo "For add-apt-repository"
read -p "Hit enter: "
# ある場合のほうが多い。つまりこのコマンドいらない場合のほうが多い。
sudo apt install software-properties-common

# Install atom
echo "Install atom"
echo -e "\tWORNING to install atom. add-apt-repositiory is buplicatable."
read -p "Hit enter: "
sudo add-apt-repository ppa:webupd8team/atom
sudo apt update
sudo apt install atom

# Bashのオートコンプリートがなかったら
echo "Install bash_completion for auto complete."
read -p "Hit enter: "
sudo apt install bash-completion
