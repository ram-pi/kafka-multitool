FROM azul/zulu-openjdk-debian:17-jre-latest

LABEL owner="ram-pi"
LABEL name="kafka-multitool"

RUN apt update -y
RUN apt install -y curl kafkacat vim dnsutils ncat
RUN curl https://packages.confluent.io/archive/7.6/confluent-7.6.1.tar.gz -o kafka.tgz \
    && mkdir kafka \
    && tar -xvzf kafka.tgz -C kafka --strip-components=1 \
    && echo "alias kcat=kafkacat" >> ~/.bashrc \
    && echo "export PATH=$PATH:/kafka/bin" >> ~/.bashrc;

CMD ["tail", "-f", "/dev/null"]
