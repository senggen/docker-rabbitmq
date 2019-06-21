FROM rabbitmq

ADD https://dl.bintray.com/rabbitmq/community-plugins/3.7.x/rabbitmq_delayed_message_exchange/rabbitmq_delayed_message_exchange-20171201-3.7.x.zip /root/rabbitmq_delayed_message_exchange-20171201-3.7.x.zip

RUN apt -y update && \
    apt -y install unzip && \
    cd /root && \
    unzip rabbitmq_delayed_message_exchange-20171201-3.7.x.zip && \
    mv rabbitmq_delayed_message_exchange-20171201-3.7.x.ez /opt/rabbitmq/plugins/ && \
    rm -rf /root/rabbitmq_delayed_message_exchange-20171201-3.7.x.zip && \
    apt-get clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i 's/{loopback_users, \[<<"guest">>\]},/{loopback_users, \[\]},/g' rabbit.app
    
ADD run.sh /root
RUN chmod +x /root/run.sh
    
CMD ["/bin/sh", "/root/run.sh"]
