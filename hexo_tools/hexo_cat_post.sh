#!/bin/bash
[ -z $@ ] && echo usage
HEXO_HOME=~/work/hexo
cat $HEXO_HOME/source/_posts/$1.md
