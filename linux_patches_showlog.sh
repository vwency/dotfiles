git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

cd linux

git checkout v6.15

git clone --depth 1 --branch v2alpha git@github.com:google/bbr.git


cp bbr/net/ipv4/tcp_bbr2.c net/ipv4/
cp bbr/net/ipv4/tcp_bbr.c net/ipv4/ 

cp bbr/net/ipv4/Kconfig net/ipv4/Kconfig


# Добавьте строку для BBR2
nano net/ipv4/Makefile
Добавьте после строки с tcp_bbr.o:
makefileobj-$(CONFIG_TCP_CONG_BBR2) += tcp_bbr2.o

cp bbr/include/net/tcp.h include/net/tcp.h
cp bbr/include/uapi/linux/inet_diag.h include/uapi/linux/inet_diag.h

cp /boot/config-$(uname -r) .config
make olddefconfig
make menuconfig
