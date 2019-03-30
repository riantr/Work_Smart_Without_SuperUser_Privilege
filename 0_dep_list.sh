aptitude show $1 | grep Depends: > need
sed 's/^Depends://g' need > need_to_download
rm -rf need
cat need_to_download
echo 'need_to_download brewed.'
