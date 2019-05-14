cd $(ls $(pwd | sed "s/$(basename `pwd`)$//g") -la | grep `basename $(pwd)` | xargs -n5 | sed '1,2d')
