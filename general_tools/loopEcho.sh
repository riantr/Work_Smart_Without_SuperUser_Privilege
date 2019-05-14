if [ "$1" = "" ];then
echo "Usage: loopEcho.sh <number>"
echo "\$1 ${1:-UnDefined}"
else
declare -i NUMB
echo NUMB is ${NUMB:-UnDefined}
for i in {1..100}
do
    echo -e "\t|$i\c"
done
echo -e "\n"
fi
