#!/bin/bash

sudo apt-get update && sudo apt-get upgrade

sudo apt-get install vim tmux git build-essential kpartx pulseview ghex bless ipython3 python3-pip emacs chromium-browser filezilla screen binwalk neovim wireshark gparted minicom lzma-alone unzip flashrom can-utils hexedit sigrok-firmware-fx2lafw gh openjdk-19-jdk curl jq docker npm gdb-multiarch libfuse-dev dfu-util libglfw3 libmbedtls14 net-tools libglfw3 libmbedcrypto7 libmbedtls14 libmbedx509-1 feh


sudo snap install --classic code

# Set up networking for gadget

sudo cp Raspi\ Gadget.nmconnection /etc/NetworkManager/system-connections

# Install ImHex

wget https://github.com/WerWolv/ImHex/releases/download/v1.28.0/imhex-1.28.0-Ubuntu-22.04-x86_64.deb

sudo dpkg -i imhex-1.28.0-Ubuntu-22.04-x86_64.deb

# Grab latest ghidra relase

mkdir -p tools;
pushd tools;

#!/bin/bash
IFS=$' \t\r\n'

assets=$(curl https://api.github.com/repos/NationalSecurityAgency/ghidra/releases | jq -r '.[0].assets[].browser_download_url')

for asset in $assets; do
    curl -OL $asset
done

# Unzip and remove archive
unzip ghidra*.zip
rm *.zip

wget https://api.github.com/repos/NationalSecurityAgency/ghidra/zipball/Ghidra_10.3.1_build

unzip Ghidra_10.3.1_build

# Download Logic
wget -O Logic.appimage https://logic2api.saleae.com/download?os=linux 
chmod +x Logic.appimage

# Set up Kaitai Struct
curl -LO https://github.com/kaitai-io/kaitai_struct_compiler/releases/download/0.10/kaitai-struct-compiler_0.10_all.deb
sudo apt-get install ./kaitai-struct-compiler_0.10_all.deb
rm ./kaitai-struct-compiler_0.10_all.deb

# Set up IDE
git clone https://github.com/kaitai-io/ide-kaitai-io.github.io

# Get 010Editor and start installer
curl -LO https://www.sweetscape.com/download/010EditorLinux64Installer.tar.gz
gunzip 010EditorLinux64Installer.tar.gz
tar xvf 010EditorLinux64Installer.tar
rm 010EditorLinux64Installer.tar
cd 010editor
./010editor

# Get ImHEX and run as test
curl -LO https://github.com/WerWolv/ImHex/releases/download/v1.25.0/imhex-1.25.0.AppImage
chmod +x imhex-1.25.0.AppImage
./imhex-1.25.0.AppImage

wget https://i.imgur.com/B5cktxT.jpeg 

popd
