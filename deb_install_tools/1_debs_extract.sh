#!/bin/bash
[ ! -d log ] && mkdir log
chmod 775 log
[ ! -d $HOME/opt/apt_deb ] && mkdir -p $HOME/opt/apt_deb
if [ -f log/need_to_download.log ]; then
    echo --------------- $(date) ----------------- >> log/extracted_debs.log
    [ ! -d backup ] && mkdir backup
    for i in $(<log/need_to_download.log);
	do
	    apt-get download $i
        echo $i >> log/downloaded_debs.log
        ls *.deb >> log/deb_file_names.log
		dpkg -X $(ls *.deb) $HOME/opt/apt_deb
        echo -e '\t[bin:\t\033[;44m' $(ls $HOME/opt/apt_deb/usr/bin |grep $i;ls $HOME/opt/apt_deb/bin |grep $i | ls $HOME/opt/apt_deb/sbin |grep $i)'\033[0m]' | xargs echo $(ls *.deb |xargs -n1 |sed 's/deb/deb[extracted]/g')|xargs echo -e $i'['$(date -d "20181101" +"%Y-%m-%d")']\t' >> log/extracted_debs.log
        ls $HOME/opt/apt_deb/usr/bin |grep $i>>/dev/null
        [ "$?" = "0" ] && echo $i >> log/downloaded_bins.log
        ls $HOME/opt/apt_deb/bin |grep $i>>/dev/null
        [ "$?" = "0" ] && echo $i >> log/downloaded_bins.log
        ls $HOME/opt/apt_deb/sbin |grep $i>>/dev/null
        [ "$?" = "0" ] && echo $i >> log/downloaded_bins.log
		mv *.deb ./backup
		echo -e '\033[;41m' $i' extracted to '$HOME'/opt/apt_deb.\033[0m\n'
	done
	rm log/need_to_download.log
    echo ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ >> log/extracted_debs.log
    cat log/extracted_debs.log | tail -n 10
else
    echo -e "Please DO \033[;44m ./0_debs_list.sh \033[0m first."
fi
chmod 444 log
