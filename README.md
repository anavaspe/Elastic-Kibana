# Dockerfile para la obtención de pruebas

Este Dockerfile ha sido creado para la generación de una imagen que contenga tanto Elasticsearch como Kibana en un mismo contenedor completamente configurado para la obtención métricas de otros contenedores mediante el stack de ELK.

## Creación de la imagen

```bash
docker build -t elasticmaskibana:latest .
```
## Ejecución del contenedor

```bash
docker run -d -p 5601:5601 -p 9200:9200 elasticmaskibana:latest
```

## Configuración

Los ficheros elasticsearch.yml y kibana.yml contienen las configuraciones básicas para su funcionamiento. El script inicio.sh crea los usuarios necesarios para la ejecución de los scripts de inicio tanto de Kibana como de Elastic, haciendo uso del comando runuser para ejecutar los scripts con sus respectivos usuarios.

## License

[MIT](https://choosealicense.com/licenses/mit/)
