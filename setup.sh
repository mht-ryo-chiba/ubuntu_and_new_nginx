#!/bin/bash
# apt-getを最新版に更新
sudo apt-get update -y && sudo apt-get upgrade -y

# nginxサイトが配布するPGPキーを追加
curl http://nginx.org/keys/nginx_signing.key | sudo apt-key add -

# リポジトリを一覧に追加
VCNAME=`cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d= -f2` && sudo -E sh -c "echo \"deb http://nginx.org/packages/ubuntu/ $VCNAME nginx\" >> /etc/apt/sources.list"
VCNAME=`cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d= -f2` && sudo -E sh -c "echo \"deb-src http://nginx.org/packages/ubuntu/ $VCNAME nginx\" >> /etc/apt/sources.list"

# アップデート後、nginxをインストール
sudo apt-get update -y && sudo apt-get install nginx -y

# nginxの起動
sudo /etc/init.d/nginx start
