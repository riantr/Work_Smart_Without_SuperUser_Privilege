#!/bin/bash
if [ -f need_to_download ]; then
    for i in $(<need_to_download);
	do
	    apt-get download $i
		dpkg -X $(ls *.deb) $HOME/opt/apt_deb
           	ls *.deb |xargs -n1 |sed 's/deb/deb\t:\t[extracted]/g'|xargs echo -e $i'[packageName]\t' >> extracted_debs
		rm *.deb
		echo -e '\033[;41m' $i' extracted to '$HOME'/opt/apt_deb.\033[0m\n'
	done
	rm need_to_download
	Echo 'In your $HOME/opt/apt_deb/usr/bin burried those gems.'
	ls ~/opt/apt_deb/usr/bin -F --full-time | sed 's/ubuntu//g;/^total/d;s/.000000000\s+0000//g' | xargs -n3| cut -f 3
else
    echo -e "Please DO \033[;44m ./0_debs_list.sh \033[0m first."
fi
