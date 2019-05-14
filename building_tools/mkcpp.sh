echo "Please input options for build `pwd|awk -F "/" '{print $NF}'`."
echo "Are you sure? Yes/No"
declare ready  "No"
declare -i flag 
read ready
if [ ! "$ready" = "No" ] || [ ! "$ready" = "no" ];then
    if [ "$ready" = "Yes" ] || [ "$ready" = "yes" ];then
        [ ! -d build ] && mkdir build 
        cd build
        echo "Please input your options for cmake"
        read var 
        cmake .. $var 1>out.log 2>error.log
        flag = $?
    fi
else 
    echo OK.
fi
cat error.log
[ ! flag -eq 0 ] && cd .. && rm -rf build

