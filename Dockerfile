FROM alpine:latest

ENV DDNS_LOG /opt/ddns/ddns.log
ENV RUN_CRON "*/5 * * * *"

WORKDIR /opt/ddns

ADD DDNS-master/dist/ddns /usr/bin/ddns

RUN echo "0 0 */1 * *   root   rm -f $DDNS_LOG" > /var/spool/cron/crontabs/root

CMD echo "$RUN_CRON   root   ddns -c config.json >> $DDNS_LOG" > /var/spool/cron/crontabs/root

ENTRYPOINT ddns -c config.json >> $DDNS_LOG && crond && tail -f $DDNS_LOG
