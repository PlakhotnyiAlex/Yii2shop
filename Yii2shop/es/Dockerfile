FROM docker.elastic.co/elasticsearch/elasticsearch:7.5.2

ADD jvm.options /usr/share/elasticsearch/config/
ADD elasticsearch.yml /usr/share/elasticsearch/config/
USER root
RUN chown elasticsearch:elasticsearch config/jvm.options config/elasticsearch.yml

USER elasticsearch
EXPOSE 9200 9300