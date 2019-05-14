#!/bin/bash
HEXO_HOME=~/work/hexo
[ ! -d $HEXO_HOME ]&& echo "Please set your HEXO_HOME in this file first." && exit 9;

if [ -z $1 ];then
    ls $HEXO_HOME/source/_posts/ -l | sed '/^total/d;/^d/d'|xargs -n9|cut -d ' ' -f 9| xargs -n1 | sed -e 's/ /\t/g'
elif [ ! -z $2 ];then
[ "$1" == "n" ] && echo create post.&&exit 1;
[ "$1" == "c" ] && echo categorize post.&&exit 2;
[ "$1" == "t" ] && echo tag post.&&exit 3;
elif [ "$1" == "--help" ];then
    echo "help"&&exit 4;

else
#ls $HEXO_HOME/source/_posts/ |grep $1| sed '=' | xargs -n 2
    ls $HEXO_HOME/source/_posts/ |grep $1| sed '=' | xargs -n 2
    if [ $? ] && [ `ls $HEXO_HOME/source/_posts/ |grep $1|sed 's/.md//g'|xargs -n 1|wc -l` -eq 1 ];then
            vim $HEXO_HOME/source/_posts/`ls $HEXO_HOME/source/_posts/ |grep $1` 
    else
        read -p "Enter your choice to edit:['q' for quit.]" CHOICE
        case $CHOICE in 
        1)
            vim $HEXO_HOME/source/_posts/`ls $HEXO_HOME/source/_posts/ |grep $1| sed '=' | xargs -n 2 | sed -n '1p'|cut -d ' ' -f 2`
        ;;
        2)
            vim $HEXO_HOME/source/_posts/`ls $HEXO_HOME/source/_posts/ |grep $1| sed '=' | xargs -n 2 | sed -n '2p'|cut -d ' ' -f 2`
        ;;
        3)
            vim $HEXO_HOME/source/_posts/`ls $HEXO_HOME/source/_posts/ |grep $1| sed '=' | xargs -n 2 | sed -n '3p'|cut -d ' ' -f 2`
        ;;
        4)
            vim $HEXO_HOME/source/_posts/`ls $HEXO_HOME/source/_posts/ |grep $1| sed '=' | xargs -n 2 | sed -n '4p'|cut -d ' ' -f 2`
        ;;
        5)
            vim $HEXO_HOME/source/_posts/`ls $HEXO_HOME/source/_posts/ |grep $1| sed '=' | xargs -n 2 | sed -n '5p'|cut -d ' ' -f 2`
        ;;
        6)
            vim $HEXO_HOME/source/_posts/`ls $HEXO_HOME/source/_posts/ |grep $1| sed '=' | xargs -n 2 | sed -n '6p'|cut -d ' ' -f 2`
        ;;
        7)
            vim $HEXO_HOME/source/_posts/`ls $HEXO_HOME/source/_posts/ |grep $1| sed '=' | xargs -n 2 | sed -n '7p'|cut -d ' ' -f 2`
        ;;
        8)
            vim $HEXO_HOME/source/_posts/`ls $HEXO_HOME/source/_posts/ |grep $1| sed '=' | xargs -n 2 | sed -n '8p'|cut -d ' ' -f 2`
        ;;
        9)
            vim $HEXO_HOME/source/_posts/`ls $HEXO_HOME/source/_posts/ |grep $1| sed '=' | xargs -n 2 | sed -n '9p'|cut -d ' ' -f 2`
        ;;
        q)
        exit 9
        ;;
        esac
    fi
fi
