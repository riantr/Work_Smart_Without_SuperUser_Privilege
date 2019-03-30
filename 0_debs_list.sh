#!/bin/bash
echo 'usage: 0_debs_list <package>'
aptitude show $1 |grep Depends: |sed 's/^Depends://g'|sed ':a;s/,/\n/g;s/|/\n/g'|sed 's/(.*//g'|sed /^$/d | xargs -n1 > need_to_download
echo $1 >> need_to_download
for i in $(<need_to_download)
do
    cat ./installed_debs | grep $i>/dev/null
    echo "You have already catched $i"
    sed -i '/^'$i'/d' need_to_download 
done
sed '=' need_to_download | xargs -n2
echo 'need_to_download brewed.'
