#!/bin/bash
[ -d source ] && cd source
if [ "$1" = "" ];then
    echo "Usage:"
elif [ "$1" = "downloaded_debs" ];then
    for i in $(<../downloaded_debs)
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

