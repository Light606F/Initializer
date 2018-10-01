# Setting up .bashrc
echo "Bash Setting."
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

source $HOME/.bashrc
