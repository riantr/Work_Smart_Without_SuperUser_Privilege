#/bin/bash
case "$TERM" in
xterm*)
    cat ~/.ssh/id_rsa.pub | xsel -i -b
    ;;
rxvt*)
    cat ~/.ssh/id_rsa.pub | xsel -i -b
    ;;
screen)
    xclip -sel clip < ~/.ssh/id_rsa.pub
    ;;
esac
echo "You have copied id_rsa.pub to your clipbord"
