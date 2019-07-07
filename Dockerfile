FROM alpine:latest

ENV DDNS_CONFIG config.json
ENV DDNS_LOG ddns.log
ENV RUN_CRON "*/5 * * * *"
ENV LOG_CLEAN_CRON "0 0 */1 * *"

WORKDIR /opt/ddns

ADD DDNS-master/dist/ddns /usr/bin/ddns

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories &&\
    apk add tzdata && \
    cp /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime && \
    echo "Asia/Hong_Kong" >  /etc/timezone && \
    apk del tzdata

RUN echo "$LOG_CLEAN_CRON   rm -f ${PWD}/$DDNS_LOG" >> /var/spool/cron/crontabs/root && \
    echo "$RUN_CRON   ddns -c ${PWD}/$DDNS_CONFIG >> ${PWD}/$DDNS_LOG 2>&1" >> /var/spool/cron/crontabs/root

ENTRYPOINT ddns -c $DDNS_CONFIG >> $DDNS_LOG &&  crond && tail -f $DDNS_LOG
