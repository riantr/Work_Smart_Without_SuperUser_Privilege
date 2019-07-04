if [ ! -z $1 ]; then
nvidia-smi pmon -s u -d 5 -i $1
else
watch -d  nvidia-smi pmon -s m
fi
