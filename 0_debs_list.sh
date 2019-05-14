#!/bin/bash
[ ! -d log ] && mkdir log
chmod 775 log
list_depends(){
		apt-cache depends $1 | grep Depends > log/temp.log 
		if [ $? -eq 0 ];then
		    echo $1 > log/need_to_download.log
		fi
        grep Depends: log/temp.log | xargs -n2| sed 's/Depends://g' | xargs -n1 >> log/need_to_download.log
        rm log/temp.log
        sed -i '/^$/d' log/need_to_download.log 
}

refresh_depends(){
    for i in $(<log/need_to_download.log)
    do
	if [ -f log/extracted_debs.log ]; then
		cut -f 1 log/extracted_debs.log | grep  $i"\[" > /dev/null 
		if [ $? -eq 0 ]; then
		    echo "You have already downloaded $i"
		    sed -i '/^'$i'/d' log/need_to_download.log 
		fi
	fi
    done
    sed -i '/|/d;/^</d' log/need_to_download.log
}

display_depends(){
    declare -i number=0
    number=$(sed -n '$=' log/need_to_download.log)
    if [  $number -gt 1 ];then
        echo  "There are $number packages need to download."
        sed '=' log/need_to_download.log | xargs -n2
        echo 'file need_to_download.log brewed.'
    elif [ $number -eq 1 ];then
        echo  "There are 1 package need to download."
        sed '=' log/need_to_download.log | xargs -n2
        echo 'file need_to_download.log brewed.'
    else
        rm log/need_to_download.log
        echo "Nothing will be download."
    fi
}

if [ -z $1 ];then
    echo 'apt search <Package> | grep "amd64 \| all"'
    echo 'usage: ./0_debs_list <packageName>'
else 
    list_depends()
    refresh_depends()
    display_depends()
fi
chmod 444 log
