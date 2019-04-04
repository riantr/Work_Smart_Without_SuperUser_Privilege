#!/bin/bash
echo Only 3 levels support.
echo Bug exists, if you got \"Nothing will be download.\", you\'d better re-do your command again. 
[ ! -d log ] && mkdir log
if [ -z $1 ];then
    echo 'apt search <Package> | grep "amd64 \| all"'
    echo 'usage: ./0_debs_list <packageName>'
else 
		apt-cache depends $1 | grep Depends > log/temp.log 
		if [ $? -eq 0 ];then
		    echo $1 > log/need_to_download.log
		fi
        grep Depends: log/temp.log | xargs -n2| sed 's/Depends://g' | xargs -n1 >> log/need_to_download.log
        sed -i '/^$/d;/^</d;/^|/d' log/need_to_download.log 
        if [ "$2" -ge "2" ];then
            for i in $(<log/need_to_download.log)
            do 
                apt-cache depends $i | grep Depends > log/temp.L2.log
                grep Depends: log/temp.L2.log | xargs -n2| sed 's/Depends://g' | xargs -n1 >> log/need_to_download.log
                sed -i '/^$/d;/^</d;/^|/d' log/need_to_download.log 
            done
            if [ "$2" = "3" ];then
                for j in $(<log/need_to_download.log)
                do 
                    apt-cache depends $j | grep Depends > log/temp.L3.log
                    grep Depends: log/temp.L3.log | xargs -n2| sed 's/Depends://g' | xargs -n1 >> log/need_to_download.log
                    sed -i '/^$/d;/^</d;/^|/d' log/need_to_download.log 
                done
            fi
        fi
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
    sed -i '/|/d' log/need_to_download.log
    sort log/need_to_download.log | uniq|tee log/need_to_download.log 
        rm log/temp.log
        [ -f log/temp.L2.log ] && rm log/temp.L2.log
        [ -f log/temp.L3.log ] && rm log/temp.L3.log
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
        echo $number
        rm log/need_to_download.log
        echo "Nothing will be download."
    fi
fi
