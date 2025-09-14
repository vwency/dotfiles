#!/bin/bash

sudo apt install cpufrequtils  
echo 'GOVERNOR="performance"' | sudo tee /etc/default/cpufrequtils  
sudo systemctl restart cpufrequtils  

echo "✅ Set up completed $SYSCTL_FILE"
