echo "Press Ctl+c to stop monitor your GPU."
#--format=csv power.draw,utilization.gpu,fan.speed,temperature.gpu,memory.used

watch -d -n0.5 nvidia-smi --format=csv --query-gpu=utilization.gpu,memory.free

