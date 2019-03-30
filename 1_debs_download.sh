#!/bin/bash
if [ -f need_to_download ]; then
    aptitude download $(<need_to_download)
    rm -rf need_to_download
    ls | grep amd64.deb >debs
    ls | grep all.deb >>debs
    sed '=' debs |xargs -n2
else
    echo -e "Please DO \033[;41m ./0_debs_list.sh \033[0m first."
fi
