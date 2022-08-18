#!/bin/bash

clear;

echo '';
echo '> ------------------------------------------------------';
echo '> 当前脚本可以修复Air在SteamOS(HoloISO)中出现的一些问题';
echo '> 脚本作者: 魂魄妖梦 (https://youmukonpaku.com)';
echo '> 二进制文件: gamescope 构建时间: 2022-08-16';
echo '> ------------------------------------------------------';
echo '';

echo '开始安装基础依赖...';
sudo pacman -Sy --needed base-devel git cmake python3 meson ninja dbus-python vulkan-headers;
git clone https://aur.archlinux.org/pikaur.git;
cd pikaur;
makepkg -fsri;
cd ../;
echo '基础依赖安装完成...';

echo '开始安装HandyGCCS...';
echo '备注: HandyGCCS可以修复Air功能键失效的问题.';
pikaur -Sy --needed handygccs-git;
sudo udevadm control -R;
sudo systemctl enable handycon && sudo systemctl start handycon;
echo 'HandyGCCS安装完成...';

echo '开始安装rz608-fix-git...';
echo '备注: rz608-fix-git可以修复Air息屏唤起后丢失Wi-Fi驱动的问题...';
sudo pikaur -Sy --needed rz608-fix-git
sudo udevadm control -R
echo 'rz608-fix-git安装完成...';

echo '所有操作均已完成, 尽情享受吧!';
