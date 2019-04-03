DEB_EXTRACT_PATH=$HOME/opt/apt_deb
echo "Sometimes there might be some lib/inc outside the default path, you should check it by yourself."
read -p "Press Enter to continue."
echo -e "export PATH=$DEB_EXTRACT_PATH/usr/bin:$DEB_EXTRACT_PATH/usr/sbin:$PATH" | tee -a export_path.need_to_source.$(whoami)
read -n 1
echo -e "export LD_LIBRARY_PATH=$DEB_EXTRACT_PATH/lib/x86_64-linux-gnu:$DEB_EXTRACT_PATH/lib:$DEB_EXTRACT_PATH/lib64:$DEB_EXTRACT_PATH/usr/lib:$DEB_EXTRACT_PATH/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH"| tee -a export_path.need_to_source.$(whoami)

read -n 1
echo -e "export C_INCLUDE_PATH=$DEB_EXTRACT_PATH/usr/include:$C_INCLUDE_PATH"| tee -a export_path.need_to_source.$(whoami)

read -n 1
echo -e "export CPLUS_INCLUDE_PATH=$DEB_EXTRACT_PATH/usr/include:$CPLUS_INCLUDE_PATH"| tee -a export_path.need_to_source.$(whoami)

read -n 1
echo "------------------------------------------------------------------------------"
echo -e "You should \033[;41mcat export_path.need_to_source.$(whoami)>>~/.bashrc && source ~/.bashrc\033[0m before build your program."
echo "------------------------------------------------------------------------------"
