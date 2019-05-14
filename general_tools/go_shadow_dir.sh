pwd| sed "s/\/home\/$(whoami)\/opt\/apt_deb//g" ||cd
[ ! $? == 0 ] && echo "NOT installed by SU yet."
