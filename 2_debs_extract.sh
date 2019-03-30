#!/bin/bash
for i in $(<debs)
do
    dpkg -X $i $HOME/opt/apt_deb
    echo $i >> installed_debs
    rm -rf $i
done
rm debs
echo "You have installed following debs."
sed '=' installed_debs |xargs -n2
echo "DONE!"
