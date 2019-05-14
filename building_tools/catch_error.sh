if [ -z $1 ];then
echo -e "usage"
else 
sed -n "$1p" $2
fi
