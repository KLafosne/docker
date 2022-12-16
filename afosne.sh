#!/bin/bash
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
PLAIN='\033[0m'

red() {
    echo -e "\033[31m\033[01m$1\033[0m"
}

green() {
    echo -e "\033[32m\033[01m$1\033[0m"
}

yellow() {
    echo -e "\033[33m\033[01m$1\033[0m"
}

clear
echo "#############################################################"
echo -e "#                 ${RED} v2ray 一键安装脚本${PLAIN}                  #"
echo -e "# ${GREEN}作者${PLAIN}: afosne                                      #"
echo -e "# ${GREEN}电报${PLAIN}: https://t.me/uafosne                        #"
echo "#############################################################"
echo ""

yellow "安装开始："
#下载核心程序
apt update
apt install screen -y
mkdir /afosne
wget https://github.com/KLafosne/afosne/raw/master/afosne
#设置运行权限
chmod +x /afosne/afosne
rm -f /afosne/config.json
wget https://github.com/KLafosne/afosne/raw/main/config.json
# 开始后台运行
screen afosne/afosne run
#
green "安装完成"
