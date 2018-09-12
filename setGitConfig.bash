# setGitConfig.bash
# Version 0.0.1
# Author : Light606F

# input name
if [[ ! `cat .git/config | grep Light606F@` ]]; then
	echo "Set name Light606F."
	mv .git/config .git/configTmp
	sed -e 's/url = https:\/\//url = https:\/\/Light606F@/g' .git/configTmp > .git/config
	rm .git/configTmp
fi

if [[ ! `cat .git/config | grep user` ]]; then
	echo "Set user."
	user="
	[user]\n
	\tname = Light606F\n
	\temail = Light606F.tsukineko@gmail.com
	"
	echo -e $user >> .git/config
fi

if [[ ! `cat .git/config | grep alias` ]]; then
	echo "Set alias."
	alias="
	[alias]\n
	\tst = status\n
	\tco = checkout\n
	\tllog = log --decorate --all --graph --oneline
	"
	# echo -e $alias
	echo -e $alias >> .git/config
fi
