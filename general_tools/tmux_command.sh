#/bin/bash
#Usage: 
#tmux_command.sh n <SessionName> <WindowName>
#tmux_command.sh r <SessionName>
#tmux_command.sh ls
#tmux_command.sh k <SessionName>
#tmux_command.sh ka
if [ "$1" = "n" ];then
#   echo "you will create a new session."
    if [ "$2" == "" ];then
        echo "Usage: tmux_command.sh n <SessionName> <WindowName>"
    else
        tmux new -s $2 -n $3
    fi
    exit 1
elif [ "$1" = "r" ];then
#    echo "You will recover a session."
    if [ "$2" == "" ];then
        echo "Usage: tmux_command.sh r <SessionName>"
    else
        tmux at -t $2
    fi
    exit 2
elif [ "$1" = "ls" ];then
#    echo "You will list all sessions."
    tmux ls
    exit 3
elif [ "$1" = "k" ];then
#    echo "You will kill a session."
    if [ "$2" == "" ];then
        echo "Usage: tmux_command.sh k <SessionName>"
    else
        tmux kill-session -t $2
    fi
    exit 4
elif [ "$1" = "ka" ];then
#    echo "You will kill all sessions."
    tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill
    exit 5
elif [ "$1" = "key" ];then
    vim ~/.tmux.conf
elif [ "$1" = "mux" ];then
    if [ "$2" = "" ];then 
        echo -e "Usage:\n\ttmux_command.sh mux <setName>"
    else
        tmuxinator o $2
    fi
elif [ "$1" = "a" ];then
    tmux attach -t $2
elif [ "$1" == "" ];then
    echo -e "Usage:\nCreate new session:\ttmux_command.sh n <SessionName> <WindowName>\nRecover a session:\ttmux_command.sh r <SessionName>\nList all sessions:\ttmux_command.sh ls\nKill a session:\t\ttmux_command.sh k <SessionName>\nKill all sessions:\ttmux_command.sh ka\nEdit tmux shortcuts:\ttmux_command.sh key\nEdit tmux-set config:\ttmux_command.sh mux <SetName>\n"
    tmux ls
    exit 0
fi
