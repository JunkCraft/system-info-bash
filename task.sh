#!/bin/bash

echo "System Hostname:"
hostname
echo ""

echo "Operating System:"
lsb_release -d | cut -f2-
echo ""

echo "System Uptime:"
uptime -p
echo ""

echo "Linux Kernel Version:"
uname -r
echo ""

echo "CPU Information:"
lscpu | grep "Model name"
lscpu | grep "CPU(s):" | head -1
echo ""

echo "Memory Information:"
free -h | grep Mem
echo ""

echo "Network Information:"
ip addr show
echo ""

echo "Filesystem Usage:"
df -hT | awk 'NR==1 || /\/dev\//'
echo ""

echo "Last 5 lines from syslog with 'error' (case-insensitive):"
sudo grep -i error /var/log/syslog | tail -5
