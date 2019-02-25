#!/usr/bin/env python3
"""Get CPU utilization for user-space processes from top."""


import re
import sys

for line in sys.stdin:
    if "Cpu(s)" in line:
        break


match = re.search(r'(\S+)\s+us', line)
cpu = match.group(1)

print(cpu.replace("%", ""))
