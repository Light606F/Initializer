# Install atom
echo "Install teamviewer"
read -p "Hit enter: "

# 何故かamd64よりi386のほうがバグとかない
wget https://download.teamviewer.com/download/teamviewer_i386.deb
sudo apt install ./teamviewer_i386.deb
