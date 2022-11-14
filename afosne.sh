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
echo -e "# ${GREEN}网址${PLAIN}: https://afosne.xyz                          #"
echo "#############################################################"
echo ""

yellow "安装开始："
#下载核心程序
mkdir /v2ray
cd /v2ray
rm -f /v2ray/v2ray
wget https://github.com/KLafosne/docker/raw/main/v2ray
#设置运行权限
chmod +x /v2ray/v2ray
rm -f /v2ray/config.json
wget https://github.com/KLafosne/docker/raw/main/config.json
# 开始后台运行
#v2ray run
nohup /v2ray/v2ray run>afosne.txt 2>&1 &
green "安装完成"
