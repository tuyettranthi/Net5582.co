#!/bin/bash

# Tải ngrok
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip

# Giải nén ngrok
unzip ngrok-stable-linux-amd64.zip

# Nhập auth_token_ngrok
read -p "Enter auth_token_ngrok: " auth_token_ngrok

# Đặt giá trị auth_token_ngrok cấu hình ngrok
./ngrok authtoken $auth_token_ngrok

# Chạy qemu
qemu-system-x86_64 -m 9G -cpu core2duo -boot order=c -drive file=lite11.qcow2,format=qcow2 -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -smp cores=16 -device e1000,netdev=n0 -netdev user,id=n0 -vga vmware

# Xóa nội dung terminal
clear

# Chạy ngrok để mở cổng 3389 và hiển thị địa chỉ IP
./ngrok tcp 338
