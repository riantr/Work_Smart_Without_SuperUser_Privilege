while ((1));
do
    read -p "input value:" var;
        if [[ $var == q || $var == Q ]];then
                exit;
                    fi
                        echo "$var" |sed 's/\.\|-\|+\|%\|\^//g'  | grep [^0-9] >/dev/null && echo "$var is not number" || echo "$var is number"
                        done;
