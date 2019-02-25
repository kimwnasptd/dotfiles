free -h --giga | awk 'NR==2{printf "%s", $3 }'
