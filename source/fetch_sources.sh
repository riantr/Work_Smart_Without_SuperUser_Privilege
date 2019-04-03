#!/bin/bash
[ -d source ] && cd source
if [ "$1" = "" ];then
    echo -e "\tUsage:\n\t./catch_sources.sh downloaded_bins\n\t./catch_sources.sh clean\n\t./catch_sources.sh rm\n\t./catch_sources.sh <PackageName>\n "
elif [ "$1" = "downloaded_bins" ];then
    for i in $(<../log/downloaded_bins.log)
        do
        apt-get source $i
        done
elif [ "$1" = "clean" ];then
    ls -l | grep -v ".sh" | sed '/^d/d;/^total/d'|xargs -n9|cut -d ' ' -f 9 | tee list >> /dev/null
    sed -i '/^sources_debs.sh/d;/^make_sources.sh/d' list
    for i in $(<list)
        do
        rm $i
        done
elif [ "$1" = "rm" ];then
    ls -l | grep -v ".sh" | sed '/^total/d'|xargs -n9|cut -d ' ' -f 9 | tee list >> /dev/null
    sed -i '/^sources_debs.sh/d;/^make_sources.sh/d' list
    for i in $(<list)
        do
        rm -rf $i
        done
    rm list
else
    apt-get source $1
fi

