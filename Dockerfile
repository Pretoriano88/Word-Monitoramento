FROM wordpress:latest

# Instalar o Node Exporter
RUN apt-get update && apt-get install -y wget \
    && wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz \
    && tar xvfz node_exporter-1.3.1.linux-amd64.tar.gz \
    && mv node_exporter-1.3.1.linux-amd64/node_exporter /usr/local/bin/ \
    && rm -rf node_exporter-1.3.1.linux-amd64* \
    && apt-get clean

# Expor a porta do Node Exporter
EXPOSE 9100

# Iniciar o Node Exporter em segundo plano e depois iniciar o WordPress
CMD /usr/local/bin/node_exporter & docker-entrypoint.sh apache2-foreground
