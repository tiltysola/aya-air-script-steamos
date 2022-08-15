#!/bin/bash

clear;

echo '';
echo '----------------------------------------------------------------';
echo '| Post install script for Ayaneo Air w/ Steam OS (HoloISO).    |';
echo '| Script by YoumuKonpaku (https://youmukonpaku.com)            |';
echo '----------------------------------------------------------------';
echo '';

echo 'Pre-installation start...';
sudo pacman -Sy meson ninja cmake python3 dbus-python vulkan-headers;
sudo pacman -Sy --needed base-devel git
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -fsri
cd ../
echo 'Pre-installation end...';

sudo pikaur -S rz608-fix-git
sudo udevadm control -R

if [ ! -d 'HandyGCCS' ]; then
  echo 'Start to clone repository: ShadowBlip/HandyGCCS';
  git clone 'https://github.com/ShadowBlip/HandyGCCS.git';
else
  echo 'Repository exists: ShadowBlip/HandyGCCS';
fi

echo 'Start to install HandyGCCS for Ayaneo Air';
cd HandyGCCS;
git switch aya-air;
sudo make install;
cd ../;
echo 'Installation finished: HandyGCCS';

if [ ! -d 'gamescope-plus' ]; then
  echo 'Start to clone repository: ruineka/gamescope-plus';
  git clone 'https://github.com/ruineka/gamescope-plus.git';
else
  echo 'Repository exists: ruineka/gamescope-plus';
fi

echo 'Start to install gamescope-plus for Ayaneo Air';
cd gamescope-plus;
git switch force-orientation;
git submodule update --init;
git switch gamescope-plus;
meson build/;
ninja -C build/;
sudo meson install -C build/ --skip-subprojects;
sudo cp /usr/local/bin/gamescope /usr/bin/;
cd ../;
echo 'Installation finished: gamescope-plus';

if [ ! -d 'gamescope-session' ]; then
  echo 'Start to clone repository: ruineka/gamescope-session';
  git clone 'https://github.com/ruineka/gamescope-session.git';
else
  echo 'Repository exists: ruineka/gamescope-session';
fi

echo 'Start to install gamescope-session for Ayaneo Air';
cd gamescope-session;
sudo cp -f -r ./etc /;
sudo cp -f -r ./usr /;
cd ../;
echo 'Installation finished: gamescope-session';

echo 'All operations has done, enjoy your Ayaneo Air!';
