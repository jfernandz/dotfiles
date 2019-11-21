#!/bin/sh

# nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{ print "GPU",""$1"","%"}'

# My system does not support the flag --query-gpu=utilization.gpu
# That's why I modify the flag to show instead the used video memory.
nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits | awk '{ print ""$1"","MiB"}'
