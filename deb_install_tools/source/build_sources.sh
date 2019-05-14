#!/bin/bash
[ -d source ] && cd source
./fetch_sources.sh clean
ls -l |grep -v ".sh" |sed '/^-/d;/^total/d'|xargs -n9|cut -d ' ' -f 9|tee list
for i in $(<list)
    do
        sed -i "/^$i/d" list
        cd $i
        if [ -f configure ];then
#[ ! -d build ] && mkdir build
#cd build
            echo "We are going to build $i"
            read -p "input your special setup:" SETUP
            sed  -i 's/prefix=\/usr\//prefix=$HOME\/\./g' configure
            ./configure --prefix=$HOME/.local $SETUP 1>$i.out.configure 2>$i.err.configure
#./configure 1>out.$iconfigure 2>err.$i.configure
            if [ -s err.$i.configure  ];then
                cat err.$i.configure
                echo -e "We need a \033[;41mmanual\033[0m build for $i"
                echo break
                echo -e "\033[;41m$i\033[0m\t`cat err.$i.configure`\n" >> /home/renyongxiang/src/shell/1.Work_Smart_Without_SuperUser_Privilege_github/log/error_autobuilding.log
            else 
                make -j21
                make check
                [ $? -eq 0 ] && echo Congratulate, we have autobuild $i
                sed -i "/^$i/d" /home/renyongxiang/src/shell/1.Work_Smart_Without_SuperUser_Privilege_github/log/downloaded_source.log
                echo $i >> /home/renyongxiang/src/shell/1.Work_Smart_Without_SuperUser_Privilege_github/log/build_source.log
                echo -e "\033[;41m$i\033[0m\t`cat out.$i.configure`\n" >> /home/renyongxiang/src/shell/1.Work_Smart_Without_SuperUser_Privilege_github/log/out_autobuilding.log
            fi
        else 
            echo "No configure file found."
            echo -e "\033[;41m$i\033[0m\t No configure file found" >> /home/renyongxiang/src/shell/1.Work_Smart_Without_SuperUser_Privilege_github/log/error_autobuilding.log
        fi
        cd ..
        [ -d build ] && cd ..
        [ -d $i ] && cd .
        [ -d source ] && cd source
    done

echo DONE!
rm list

