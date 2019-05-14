#!/bin/bash
HEXO_HOME=~/work/hexo
man $1 > $1.help
if [ "$?" = "0" ] && [ ! -f $HEXO_HOME/source/_posts/$1-usage.md ];then
    hexo n $1-usage
    cat $1.help >> $HEXO_HOME/source/_posts/$1-usage.md
else
    cat $1.help >> $HEXO_HOME/source/_posts/$1-usage.md
fi
rm $1.help
