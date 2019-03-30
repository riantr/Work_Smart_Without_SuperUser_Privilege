#!/bin/bash
for i in $(<debs)
do
    dpkg -X $i /home/renyongxiang/opt/apt_deb
done
