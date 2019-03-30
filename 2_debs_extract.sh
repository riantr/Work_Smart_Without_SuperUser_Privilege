#!/bin/bash
if [ -f debs ]; then
    for i in $(<debs)
    do
        dpkg -X $i $HOME/opt/apt_deb
        echo $i >> installed_debs
        rm $i
    done
    rm debs
    echo "You have installed following debs."
    sed '=' installed_debs |xargs -n2
    echo "\033[;41m DONE!\033[0m"
else
    echo -e "Please DO \033[;44m ./1_debs_download.sh \033[0m first."
fi
