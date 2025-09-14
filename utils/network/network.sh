#!/bin/bash

SYSCTL_FILE="/etc/sysctl.d/custom.conf"

if sysctl net.ipv4.tcp_available_congestion_control 2>/dev/null | grep -qw bbr2; then
  CONG_CONTROL="net.ipv4.tcp_congestion_control=bbr2"
else
  echo "bbr2 is not supported"
  CONG_CONTROL=""
fi

sudo tee "$SYSCTL_FILE" > /dev/null <<EOF
net.core.rmem_max=16777216
net.core.wmem_max=16777216
net.ipv4.tcp_rmem=4096 87380 16777216
net.ipv4.tcp_wmem=4096 65536 16777216
$CONG_CONTROL
net.ipv4.tcp_fastopen=3
net.ipv4.tcp_mtu_probing=1

net.core.netdev_max_backlog=5000
net.core.somaxconn=4096
net.ipv4.tcp_max_syn_backlog=8192

vm.swappiness=10
vm.vfs_cache_pressure=50
vm.dirty_ratio=10
vm.dirty_background_ratio=5

kernel.kptr_restrict=2
kernel.dmesg_restrict=1
kernel.unprivileged_bpf_disabled=1
kernel.perf_event_paranoid=3
EOF

sudo sysctl --system

echo "✅ Set up completed $SYSCTL_FILE"
