#!/bin/bash

# Crear directorios para logs si no existen
mkdir -p /var/log/container
touch /var/log/container/elasticsearch.log
touch /var/log/container/kibana.log

#Crear los grupos y usuarios de elasticsearch y kibana
groupadd -r elasticsearch
groupadd -r kibana
useradd -m -d /home/elasticsearch -s /bin/bash elasticsearch
useradd -m -d /home/kibana -s /bin/bash kibana

# Iniciar Elasticsearch en segundo plano como usuario elasticsearch

runuser -u elasticsearch -- /usr/share/elasticsearch/bin/elasticsearch > /var/log/container/elasticsearch.log 2>&1 &
ES_PID=$!

# Esperar un tiempo para que Elasticsearch se inicie
sleep 30

# Iniciar Kibana en segundo plano

runuser -u kibana -- /usr/share/kibana/bin/kibana > /var/log/container/kibana.log 2>&1 &
KIBANA_PID=$!

echo "Elasticsearch iniciado con PID: $ES_PID"
echo "Kibana iniciado con PID: $KIBANA_PID"

# Mantener el contenedor en ejecución
tail -f /dev/null