#! /bin/bash 
echo "termux"
apt update 
apt upgrade -y
pkg install git -y
pkg install wget -t
termux-setup-storage
apt install proot-distro -y
git clone https://github.com/sagar040/proot-distro-nethunter.git
cd proot-distro-nethunter
bash install-nethunter.sh --install


#pkg install clang
#pkg install libxml2 libxslt
#pip install cython
#pip install lxml
