DEB_EXTRACT_PATH=$HOME/opt/apt_deb
echo "Sometimes there might be some lib/inc outside the default path, you should check it by yourself."
read -p "Press Enter to continue."
echo -e "export \033[;41m PATH\033[0m=$DEB_EXTRACT_PATH/usr/bin:$DEB_EXTRACT_PATH/usr/sbin:$PATH"
read -n 1
echo -e "export \033[;41m LD_LIBRARY_PATH\033[0m=$DEB_EXTRACT_PATH/lib/x86_64-linux-gnu:$DEB_EXTRACT_PATH/lib:$DEB_EXTRACT_PATH/lib64:$DEB_EXTRACT_PATH/usr/lib:$DEB_EXTRACT_PATH/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH"
read -n 1
echo -e "export \033[;41m C_INCLUDE_PATH\033[0m=$DEB_EXTRACT_PATH/usr/include:$C_INCLUDE_PATH"
read -n 1
echo -e "export \033[;41m CPLUS_INCLUDE_PATH\033[0m=$DEB_EXTRACT_PATH/usr/include:$CPLUS_INCLUDE_PATH"
read -n 1
echo "------------------------------------------------------------------------------"
echo -e "You should [\033[;41msource profile.apt_deb\033[0m] before build your program."
echo -e "If you found it works, your should [\033[;41mcat profile.apt_deb >> ~/.profile && source ~/.profile\033[0m]. "
echo "------------------------------------------------------------------------------"
