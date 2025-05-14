FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y adduser
RUN apt-get install -y systemctl

#Install Elastic search
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-9.0.0-amd64.deb && dpkg -i elasticsearch-9.0.0-amd64.deb

RUN rm /etc/elasticsearch/elasticsearch.yml
COPY ./elasticsearch.yml /etc/elasticsearch

#Install Kibana
RUN wget https://artifacts.elastic.co/downloads/kibana/kibana-9.0.0-amd64.deb && dpkg -i kibana-9.0.0-amd64.deb

RUN rm /etc/kibana/kibana.yml
COPY ./kibana.yml /etc/kibana


COPY ./inicio.sh /
RUN chmod +x /inicio.sh

ENTRYPOINT ["/inicio.sh"]


#USER elasticsearch
#Este comando se debe ejecutar sin usuario root
#CMD ["/bin/bash", "-c", "/usr/share/elasticsearch/bin/elasticsearch"]

#User root
#Este comando se ejecuta con usuario root
#CMD ["/bin/bash", "-c", "/usr/share/kibana/bin/kibana --allow-root"]