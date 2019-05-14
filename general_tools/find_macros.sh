find $2 -iname "*$1*.h" -exec ls -la -- {} + | sed -e 's/.*->//g'
