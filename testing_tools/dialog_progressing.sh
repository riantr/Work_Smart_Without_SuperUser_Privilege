#! /bin/bash
{
    for ((x=1;x<10;x++))
    do
        let X=10*x
        echo $X
        sleep 1
    done
} | dialog --gauge "Rate of progress..." 10 36
exit 0
