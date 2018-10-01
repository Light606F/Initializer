# Install atom
echo "Install atom"
echo -e "\tWORNING to install atom. add-apt-repositiory is duplicatable."
read -p "Hit enter: "

# old?
# sudo add-apt-repository ppa:webupd8team/atom
# sudo apt update
# sudo apt install atom

# official
curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt update
sudo apt install atom

echo "Setting up atom."
read -p "Hit enter: "
