#!/bin/bash
cd ~/work
xrdb ~/.Xdefaults
exec nohup xterm -ls &
