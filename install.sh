#!/bin/bash

clear;

echo '';
echo '----------------------------------------------------------------';
echo '| Post install script for Ayaneo Air w/ Steam OS (HoloISO).    |';
echo '| Script by YoumuKonpaku (https://youmukonpaku.com)            |';
echo '----------------------------------------------------------------';
echo '';

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
git switch gamescope-plus;
git submodule update --init
meson build/
ninja -C build/
meson install -C build/ --skip-subprojects
sudo cp /usr/local/bin/gamescope /usr/bin/
cd ../;
echo 'Installation finished: gamescope-plus';

echo 'All operations has done, enjoy your Ayaneo Air!';

if [ ! -d 'gamescope-session' ]; then
  echo 'Start to clone repository: ruineka/gamescope-session';
  git clone 'https://github.com/ruineka/gamescope-session.git';
else
  echo 'Repository exists: ruineka/gamescope-session';
fi

echo 'Start to install gamescope-session for Ayaneo Air';
cd gamescope-session;
sudo cp -i -r ./etc /;
sudo cp -i -r ./usr /;
cd ../;
echo 'Installation finished: gamescope-session';

echo 'All operations has done, enjoy your Ayaneo Air!';
