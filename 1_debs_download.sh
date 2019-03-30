#!/bin/bash
echo "DO ./0_debs_list.sh first."
aptitude download $(<need_to_download)
rm -rf need_to_download
ls | grep amd64.deb >debs
ls | grep all.deb >>debs
sed '=' debs |xargs -n2
