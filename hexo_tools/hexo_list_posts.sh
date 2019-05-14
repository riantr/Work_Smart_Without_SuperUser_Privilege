#!/bin/bash
HEXO_HOME=~/work/hexo
if [ -z $1 ];then
    echo usage: .hlp [keyWords] [rm]
    ls $HEXO_HOME/source/_posts/
else
    if [ "$2" == "rm" ];then
        echo You are going to delete `ls ~/work/hexo/source/_posts | grep $1`.
        for i in `ls ~/work/hexo/source/_posts | grep $1| xargs -n 1`
        do
            read -p "Do you want delete $i? " Confirm
            [ "$Confirm" == "Yes" ] || [ "$Confirm" == "yes" ] || [ "$Confirm" == "y" ] && rm -r $HEXO_HOME/source/_posts/$i
        done
    else
        ls $HEXO_HOME/source/_posts | grep $1
    fi
fi
