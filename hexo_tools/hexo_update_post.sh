#!/bin/bash
HEXO_HOME=~/work/hexo
if [ ! "$(cat $HEXO_HOME/source/_posts/$1.md |grep updated:) == "updated:" ];then
sed -i "/date:/a\updated:\n    -`date`" $HEXO_HOME/source/_posts/$1.md
elif [ sed updated: ];then
sed -i "/updated:/a\    - `date`" $HEXO_HOME/source/_posts/$1.md
fi
cat $HEXO_HOME/source/_posts/$1.md

