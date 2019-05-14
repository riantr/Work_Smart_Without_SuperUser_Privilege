#/bin/bash
case "$TERM" in
xterm*)
    echo "You are using [xterm]."
    ;;
rxvt*)
    echo "You are using [rxvt]."
    ;;
screen)
    echo "You are using [screen]."
    ;;
esac
