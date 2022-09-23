#!/bin/sh

# Author : Abdullah Ibne Hanif Arean
# Email  : abdullaharean2613@gmail.com



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

wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-$1.tar.xz
tar xvf linux-$1.tar.xz

cd linux-$1

#read and write from a c file
#edit necessary things for me
#compile and build kernel
