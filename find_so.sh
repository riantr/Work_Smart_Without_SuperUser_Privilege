[ -z $1 ] && echo -e "\tusage:\n\t./find_so.sh <Path> <LibName>\n"
find $1 -iname "*$2*.so" -exec ls -l -- {} +
