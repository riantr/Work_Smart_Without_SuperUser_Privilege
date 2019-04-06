#!/bin/bash
chmod 775 log
ls |grep -v ".sh" | sed '/^source/d;/^README.md/d;/^bin_experiences/d' | tee list
for i in $(<list)
do
    rm -rf $i>>/dev/null
done
[ -f list ] && rm list
