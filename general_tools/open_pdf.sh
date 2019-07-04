if [ -z $1 ]; then
echo "usage: evince xxx.pdf"
elif [ -f $1 ]; then
evince $1
else
echo "Not found $1"
fi
