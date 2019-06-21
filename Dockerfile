FROM rabbitmq

ADD https://dl.bintray.com/rabbitmq/community-plugins/3.7.x/rabbitmq_delayed_message_exchange/rabbitmq_delayed_message_exchange-20171201-3.7.x.zip /root/rabbitmq_delayed_message_exchange-20171201-3.7.x.zip

RUN apt -y update && \
    apt -y install zip && \
    cd /root &&
    unzip rabbitmq_delayed_message_exchange-20171201-3.7.x.zip && \
    mv rabbitmq_delayed_message_exchange-20171201-3.7.x.ez /opt/rabbitmq/plugins/ && \
    rm -rf /root/rabbitmq_delayed_message_exchange-20171201-3.7.x.zip
    
ADD run.sh /root/run.sh && \
    chmod +x run.sh
    
CMD ["/bin/sh", "/root/run.sh"]
