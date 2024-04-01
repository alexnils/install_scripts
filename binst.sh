#!/bin/bash
# Installer script for Bibata Modern Ice v. 2.0.6

cd ~

folder="Bibata-Modern-Ice"
file="${folder}.tar.xz"
version="2.0.6"
url="https://github.com/ful1e5/Bibata_Cursor/releases/download/v$version/$file"
icons_folder="/usr/share/icons"

echo "Downloading $file"
wget $url

echo "Unarchiving $file"
tar -xvf $file

echo "Moving $folder to $icons_folder"
sudo mv $folder $icons_folder

echo "Deleting $file"
rm -f $file

echo "Install complete"



