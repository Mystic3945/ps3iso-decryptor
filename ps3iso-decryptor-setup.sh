#!/bin/bash

if command -v dnf &> /dev/null; then     
    if ! command -v wget &> /dev/null; then
        sudo dnf install wget -y
    fi
    if ! command -v udiskctl &> /dev/null; then
        sudo dnf install udisks2 -y
    fi     
elif command -v pacman &> /dev/null; then     
    if ! command -v wget &> /dev/null; then
        sudo pacman -S  wget --noconfirm
    fi
    if ! command -v udiskctl &> /dev/null; then
        sudo pacman -S udisks2 --noconfirm
    fi  
elif command -v apt &> /dev/null; then 
    sudo apt update    
    if ! command -v wget &> /dev/null; then
        sudo apt install wget -y
    fi
    if ! command -v udiskctl &> /dev/null; then
        sudo apt install udisks2 -y
    fi  
else     
echo "No supported package manager found"
fi

wget https://github.com/Mystic3945/ps3iso-decryptor/raw/refs/heads/main/DKEY.tar.gz
wget https://github.com/Mystic3945/ps3iso-decryptor/raw/refs/heads/main/PS3Dec

tar -xvf DKEY.tar.gz
rm DKEY.tar.gz
sudo mv REDKEY/ /usr/local/lib
sudo mv PS3Dec /usr/local/bin

tar -xvf archive.tar


if ! [ -d "/usr/local/lib/REDKEY" ]; then
  wget https://github.com/Mystic3945/ps3iso-decryptor/raw/refs/heads/main/DKEY.tar.gz
  tar -xvf DKEY.tar.gz
  rm DKEY.tar.gz
  sudo mv REDKEY/ /usr/local/lib
fi

if ! command -v PS3Dec &> /dev/null; then
    wget https://github.com/Mystic3945/ps3iso-decryptor/raw/refs/heads/main/PS3Dec
    sudo mv PS3Dec /usr/local/bin
    sudo chmod +x /usr/local/bin/PS3Dec
fi
