# NFddns
本项目的目的是将NewFuture的DDNS工具构建为一个简单易用的Docker镜像。

## 使用说明
使用时请将宿主机存放配置文件的目录挂载到/opt/ddns.

示例：`docker run -v "${PWD}:/opt/ddns" -d --net host --name nfddns ufolr/nfddns:latest`

## 环境变量说明
`DDNS_CONFIG` 配置文件，默认值 `/opt/ddns/config.json`  
`DDNS_LOG` 日志文件，默认值`、opt/ddns/ddns.log`  
`RUN_CRON` ddns执行cron表达式，默认每5分钟执行`"*/5 * * * *"`  
`LOG_CLEAN_CRON` 日志清理cron表达式，默认每天执行`"0 0 */1 * *"`