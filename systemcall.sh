#!/bin/sh

# Author : Abdullah Ibne Hanif Arean
# Email  : abdullaharean2613@gmail.com
#Variable
linux_version = $1;
s_name = $2;

# Building Environment
sudo apt install git
sudo apt install make
sudo apt install gcc
sudo apt install fakeroot
sudo apt install build-essential
sudo apt install ncurses-dev
sudo apt install xz-utils
sudo apt install libssl-dev
sudo apt install bc
sudo apt install flex
sudo apt install libelf-dev
sudo apt install bison
sudo apt install libncurses-dev
# Download & Extract Kernel Source
wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-$1.tar.xz;
tar xvf linux-$1.tar.xz;
cat systemcallcode.c >> $2.c
cd linux-$1;
# read and write from a c file
mkdir $2
cd ..
mv $2.c linux-$1/$2/
cd linux-$1/$2/
touch Makefile
printf "obj-y:= $2.o" > Makefile
cd ..
#edit necessary things for me
sed -i '/^core-y +=/ s/$/ sys_call1\//' Makefile
sed -i "\$i asmlinkage long sys_sys_call1(void) ;" include/linux/syscalls.h
sed -i '/^334.*/a 335 common  sys_call1       sys_sys_call1' arch/x86/entry/syscalls/syscall_64.tbl
# Compile The Kernel
make clean
make mrproper
wget https://raw.github.com/xanmod/linux/5.17/CONFIGS/xanmod/gcc/config_x86-64
mv config_x86-64 .config
scripts/config --disable SYSTEM_REVOCATION_KEYS
scripts/config --disable SYSTEM_TRUSTED_KEYS
scripts/config --disable CONFIG_X86_X32
yes "" | make oldconfig
make -j$(nproc)
sudo make modules_install -j$(nproc)
sudo make install -j$(nproc)
# reboot
