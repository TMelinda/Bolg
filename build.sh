#!/usr/bin/env bash
npm uninstall hexo
npm install hexo --no-optional
npm uninstall hexo-cli -g
npm install hexo-cli -g
npm install hexo-deployer-git --save
npm install hexo-toc --save
hexo generate
hexo deploy

#换成淘宝的镜像
#npm config set registry "https://registry.npm.taob
#参考链接：http://lowrank.science/Hexo-Github/
