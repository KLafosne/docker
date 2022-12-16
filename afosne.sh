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

if [[ ${OS} == 'CentOS' ]];then
	yum update -y
    yum install screen -y
else
	apt-get update
    apt install screen -y
fi

yellow "安装开始："
#下载核心程序
wget https://github.com/KLafosne/afosne/raw/master/afosne
chmod +x afosne

read -p "${yellow}输入你自己UUID:" UUID

read -p "${yellow}输入你自己端口号:" PROT

echo -e "# ${yellow}选择你需要的网络协议 #"
echo -e "# ${yellow}1.ws      2.tcp      3.http    #"
read  num                                
if [ num == 1 ]
	then
   	 network = ws
	elif [ num == 2 ]
	then
 	  network = tcp
	elif [ num == 3 ]
	then
   	network = http
	else
  	 echo "请输入上面的数字"
fi
echo  "${GreenBG} 你输入的配置信息为  端口：${port} UUID：${UUID} Network: ${network} "


touch config.json
cat <<EOF > config.json
{
    "inbound": {
        "port": ${PROT},
        "protocol": "vmess",
        "settings": {
            "clients": [
                {
                    "id": "${UUID}",
                    "level": 1,
                    "alterId": 0
                }
            ]
        },
        "streamSettings": {
            "network": "ws"
        }
    },
    "outbound": {
        "protocol": "freedom",
        "settings": {}
    },
    "inboundDetour": [],
    "outboundDetour": [
        {
            "protocol": "blackhole",
            "settings": {},
            "tag": "blocked"
        }
    ],
    "routing": {
        "strategy": "rules",
        "settings": {
            "rules": [
                {
                    "type": "field",
                    "ip": [
                        "0.0.0.0/8",
                        "10.0.0.0/8",
                        "100.64.0.0/10",
                        "127.0.0.0/8",
                        "169.254.0.0/16",
                        "172.16.0.0/12",
                        "192.0.0.0/24",
                        "192.0.2.0/24",
                        "192.168.0.0/16",
                        "198.18.0.0/15",
                        "198.51.100.0/24",
                        "203.0.113.0/24",
                        "::1/128",
                        "fc00::/7",
                        "fe80::/10"
                    ],
                    "outboundTag": "blocked"
                }
            ]
        }
    }
}
EOF


# 开始后台运行
screen afosne run

#yellow "内网穿透机子"

green "安装完成"
