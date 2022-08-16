#!/bin/bash

clear;

echo '';
echo '-------------------------------------------------------';
echo '| 当前脚本可以修复Air在SteamOS(HoloISO)中出现的一些问题     |';
echo '| 脚本作者: 魂魄妖梦 (https://youmukonpaku.com)          |';
echo '-------------------------------------------------------';
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
pikaur -Sy handygccs-git;
sudo udevadm control -R;
sudo systemctl enable handycon && sudo systemctl start handycon;
echo 'HandyGCCS安装完成...';

if [ ! -f 'gamescope' ]; then
  echo 'gamescope二进制文件不存在, 开始下载...';
  wget -c https://git.futo.design/zero/aya-air-script-steamos/-/raw/offline/binary/gamescope;
else
  echo 'gamescope二进制文件已存在, 跳过下载...';
fi

echo '开始安装gamescope...';
echo '备注: gamescope可以修复Air屏幕倒转的问题...';
sudo cp ./gamescope /usr/bin/;
echo 'gamescope安装完成...';

if [ ! -d 'gamescope-session' ]; then
  echo 'gamescope-session目录不存在, 开始下载...';
  git clone 'https://github.com/ruineka/gamescope-session.git';
else
  echo 'gamescope-session目录已存在, 跳过下载...';
fi

echo '开始安装gamescope-session...';
echo '备注: gamescope-session可以配合修复Air屏幕倒转的问题...';
cd gamescope-session;
sudo cp -f -r ./etc /;
sudo cp -f -r ./usr /;
cd ../;
echo 'gamescope-session安装完成...';

echo '开始安装rz608-fix-git...';
echo '备注: rz608-fix-git可以修复Air息屏唤起后丢失Wi-Fi驱动的问题...';
sudo pikaur -S rz608-fix-git
sudo udevadm control -R
echo 'rz608-fix-git安装完成...';

echo '所有操作均已完成, 尽情享受吧!';
