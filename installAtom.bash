# Install atom
echo "Install atom"
echo -e "\tWORNING to install atom. add-apt-repositiory is duplicatable."
read -p "Hit enter: "

sudo add-apt-repository ppa:webupd8team/atom
sudo apt update
sudo apt install atom

echo "Setting up atom."
read -p "Hit enter: "
