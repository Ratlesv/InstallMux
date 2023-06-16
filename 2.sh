#! /bin/bash 
echo "termux"
#apt update && upgrade
#pkg install git -y
#pkg install wget -t
#termux-setup-storage
#install proot-distro


#
echo "update system"
#
apt update
apt upgrade -y
#
echo "install tools-web ubuntu"
#
apt install sudo -y
apt install figlet -y
apt install git -y
apt install wget -y
apt install curl -y
apt install zsh
apt install snapd
apt install lynx
apt install php -y
apt install php-curl -y

#
figlet "perl"
#
'cpan install HTTP::Cookies module
cpan install LWP::UserAgent module
cpan install Term::ReadKey module'
#

#
figlet "python2|3"
#
apt install python-is-python3 -y
apt install python3-pip -y
apt install python2-minimal -y
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | python2
curl -sS https://bootstrap.pypa.io/get-pip.py | python3
sudo python2 setup.py -i
#
figlet "Go 1.19"
#
wget https://go.dev/dl/go1.19.9.linux-arm64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.9.linux-arm64.tar.gz
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
export GO111MODULE="auto"
go env -w GO111MODULE=auto
source ~/.bashrc
go --version
rm go1.19.9.linux-arm64.tar.gz
#
figlet "attack"
#
apt install wapiti
wapiti --update
apt install nikto
pip install sqlmap
pip install searcher
apt install ruby -y
apt install bundler -y
gem install lolcat
apt install whatweb -y
apt install whois -y

exit
#'sudo apt install tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer'







