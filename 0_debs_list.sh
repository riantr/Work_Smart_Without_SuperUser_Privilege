#!/bin/bash
if [ -z $1 ];then
    echo 'apt search <Package> | grep "amd64 \| all"'
    echo 'usage: 0_debs_list <packageName>'
else 
		apt-cache depends $1 |grep Depends: | xargs -n2| sed 's/Depends://g' | xargs -n1 > need_to_download
		if [ $? -eq 0 ];then
		    echo $1 >> need_to_download
		fi
    for i in $(<need_to_download)
    do
	if [ -f ./extracted_debs ]; then
		cut -f 1 extracted_debs | grep  $i"\[" > /dev/null 
		if [ $? -eq 0 ]; then
		    echo "You have already downloaded $i"
		    sed -i '/^'$i'/d' need_to_download 
		fi
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
        echo "$1 don't need to download."
    fi
fi
