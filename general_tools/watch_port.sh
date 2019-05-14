if [ ! -z $1 ];then
    lsof -i:$1
else
    read -p "enter port number:" PORT
    lsof -i:$PORT
fi
