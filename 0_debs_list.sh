#!/bin/bash
if [ -z $1 ];then
    echo 'apt search <Package> | grep amd64'
    echo 'usage: 0_debs_list <packageName>'
else 
    aptitude show $1 |grep Depends: |sed 's/^Depends://g'|sed ':a;s/,/\n/g;s/|/\n/g'|sed 's/(.*//g'|sed /^$/d | xargs -n1 > need_to_download
    echo $1 >> need_to_download
    for i in $(<need_to_download)
    do
        cat ./installed_debs | grep $i > /dev/null
        if [ $? -eq 0 ]; then
            echo "You have already downloaded $i"
            sed -i '/^'$i'/d' need_to_download 
        fi
    done
    declare -i number=0
    number=$(sed -n '$=' need_to_download)
    if [  $number -gt 1 ];then
        echo  "There are $number packages need to download."
        sed '=' need_to_download | xargs -n2
        echo 'file need_to_download brewed.'
    elif [ $number -eq 1 ];then
        echo  "There are 1 package need to download."
        sed '=' need_to_download | xargs -n2
        echo 'file need_to_download brewed.'
    else
        echo "$1 already downloaded."
    fi
fi
