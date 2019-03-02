#!/bin/sh

nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits | awk '{ print ""$1"","MiB"}'
