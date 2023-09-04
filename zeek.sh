#!/bin/bash
curl -so wazuh-agent.deb https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.4.4-1_amd64.deb && sudo WAZUH_MANAGER='192.168.2.25' WAZUH_AGENT_GROUP='default' WAZUH_AGENT_NAME='Zeek' dpkg -i ./wazuh-agent.deb
sudo systemctl daemon-reload
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent
sudo apt install cmake make gcc g++ flex bison libpcap-dev libssl-dev python3-dev swig zlib1g-dev
wget https://download.zeek.org/zeek-5.0.9.tar.gz
tar -xf zeek-5.0.9.tar.gz
cd zeek-5.0.9
./configure --prefix=/opt/zeek
make
sudo make install
nano ~/.bashrc
export PATH=/opt/zeek/bin:$PATH
export ZEEKPATH=/opt/zeek/share/zeek:/opt/zeek/share/zeek/policy:/opt/zeek/share/zeek/site
source ~/.bashrc
sudo nano /opt/zeek/etc/node.cfg
