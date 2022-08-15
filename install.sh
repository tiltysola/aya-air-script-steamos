#!/bin/bash

clear;

echo '';
echo '----------------------------------------------------------------';
echo '| Post install script for Ayaneo Air w/ Steam OS (HoloISO).    |';
echo '| Script by YoumuKonpaku (https://youmukonpaku.com)            |';
echo '----------------------------------------------------------------';
echo '';

echo 'Clean history caches...';
rm -rf HandyGCCS;
rm -rf gamescope-session;

echo 'Start to clone repository: ShadowBlip/HandyGCCS';
git clone 'https://github.com/ShadowBlip/HandyGCCS';
echo 'Start to install HandyGCCS for Ayaneo Air';
cd HandyGCCS;
git switch aya-air;
# sudo make install;
cd ../;
echo 'Installation finished: HandyGCCS';

echo 'Start to clone repository: ruineka/gamescope-session';
git clone 'https://github.com/ruineka/gamescope-session';
echo 'Start to install gamescope-session for Ayaneo Air';
cd gamescope-session;
# sudo cp -i -r ./etc /;
# sudo cp -i -r ./usr /;
cd ../;
echo 'Installation finished: gamescope-session';

echo 'All operations has done, enjoy your Ayaneo Air!';
