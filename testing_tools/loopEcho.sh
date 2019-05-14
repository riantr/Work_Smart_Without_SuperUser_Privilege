if [ "$1" = "" ];then
echo "Usage: loopEcho.sh <number>"
else
#for i in {$(($1))..$(($2))}
for i in {1..100}
do
    echo -e "\t|$i\c"
done
echo -e "\n"
fi
