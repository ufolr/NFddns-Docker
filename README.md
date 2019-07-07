# NFddns
本项目的目的是将NewFuture的DDNS工具构建为一个简单易用的Docker镜像。

使用时请将宿主机存放配置文件的目录挂载到/opt/ddns.

示例：`docker run -v "${PWD}:/opt/ddns" -d --net host --name nfddns ufolr/nfddns:latest`