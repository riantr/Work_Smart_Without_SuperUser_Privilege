#!/bin/bash
if [ -f need_to_download ]; then
    echo --------------- $(date) ----------------- >> extracted_debs
    for i in $(<need_to_download);
	do
	    apt-get download $i
		dpkg -X $(ls *.deb) $HOME/opt/apt_deb
        echo -e '\t[bin:\t\033[;44m' $(ls $HOME/opt/apt_deb/usr/bin |grep $i)'\033[0m]' | xargs echo $(ls *.deb |xargs -n1 |sed 's/deb/deb\t:\t[extracted]/g')|xargs echo -e $i'['$(date -d "20181101" +"%Y-%m-%d")']\t' >> extracted_debs
		rm *.deb
		echo -e '\033[;41m' $i' extracted to '$HOME'/opt/apt_deb.\033[0m\n'
	done
	rm need_to_download
    echo ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ >> extracted_debs
    cat extracted_debs
else
    echo -e "Please DO \033[;44m ./0_debs_list.sh \033[0m first."
fi
