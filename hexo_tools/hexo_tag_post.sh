#!/bin/bash
HEXO_HOME=~/work/hexo
 if [ -z $1 ];then
     echo usage
 else
     if [ -n $5 ];then
     sed -i "/tags/a\  - $5" $HEXO_HOME/source/_posts/$1.md
     fi
     if [ -n $4 ];then
     sed -i "/tags/a\  - $4" $HEXO_HOME/source/_posts/$1.md
     fi
     if [ -n $3 ];then
     sed -i "/tags/a\  - $3" $HEXO_HOME/source/_posts/$1.md
     fi
     if [ -n $2 ];then
     sed -i "/tags/a\  - $2" $HEXO_HOME/source/_posts/$1.md
     fi
 fi
