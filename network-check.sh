#!/bin/bash

set -e

echo "⚙️ Applying settings..."
sudo sysctl --system 2>&1 | tee sysctl-apply.log

echo "🔍 Checking for errors..."
if grep -q -i 'failed\|unknown' sysctl-apply.log; then
  echo "⚠️ Warning! Errors found during apply:"
  grep -i 'failed\|unknown' sysctl-apply.log
else
  echo "✅ No errors found."
fi

echo -e "\n🛠 Checking main parameters:"
sysctl net.core.rmem_max net.ipv4.tcp_congestion_control vm.swappiness kernel.kptr_restrict

echo -e "\n🚦 Checking bbr2 support:"
sysctl net.ipv4.tcp_available_congestion_control
