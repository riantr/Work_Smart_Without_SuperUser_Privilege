#!/bin/bash
cat debs >> installed_debs
for i in $(<debs)
    do
        rm -rf $i
    done
rm debs
echo "You have installed following debs."
cat installed_debs
