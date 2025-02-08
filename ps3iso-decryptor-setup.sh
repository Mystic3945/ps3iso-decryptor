#!/bin/bash

YELLOW='\033[1;33m'
NOCOLOR='\033[0m'

if ! command -v wget &> /dev/null; then  
echo -e "${YELLOW}Need wget to setup script${NOCOLOR}"
fi

if ! [ -d "/usr/local/lib/PS3-ISO-DKEYS" ]; then
  wget https://github.com/Mystic3945/ps3iso-decryptor/raw/refs/heads/main/DKEY.tar.gz
  tar -xvf DKEY.tar.gz
  rm DKEY.tar.gz
  sudo mv PS3-ISO-DKEYS/ /usr/local/lib
fi

if ! command -v PS3Dec &> /dev/null; then
    wget https://github.com/Mystic3945/ps3iso-decryptor/raw/refs/heads/main/PS3Dec
    sudo mv PS3Dec /usr/local/bin
    sudo chmod +x /usr/local/bin/PS3Dec
fi

wget https://raw.githubusercontent.com/Mystic3945/ps3iso-decryptor/refs/heads/main/ps3iso-decryptor
sudo mv ps3iso-decryptor /usr/local/bin
sudo chmod +x /usr/local/bin/ps3iso-decryptor
