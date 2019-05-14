cd `pwd | sed 's/\/home\/renyongxiang\/opt\/apt_deb//g'` 2>>/dev/null
[ ! $? == 0 ] && echo "NOT installed by SU yet."
