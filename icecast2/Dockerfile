# Usar uma imagem base mínima
FROM debian:latest

# Instalar o Icecast e dependências
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y icecast2 nano && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Criar os diretórios necessários e ajustar permissões
RUN mkdir -p /var/log/icecast2 /etc/icecast2/stream && \
    chown -R icecast2:icecast /etc/icecast2 && \
    chown -R icecast2:icecast /var/log/icecast2 

# Ajustar permissões para os diretórios ADMIN / WEB
RUN chown -R icecast2:icecast /etc/icecast2/admin /etc/icecast2/web

# Copiar o arquivo de configuração para o container
COPY icecast.xml /etc/icecast2/icecast.xml


RUN echo 'ENABLE=true' | tee -a /etc/default/icecast2

# Definir o usuário com o qual o Icecast será executado
USER icecast2

# Expor as portas que o Icecast usa
EXPOSE 8000

# Definir o diretório de trabalho
WORKDIR /etc/icecast2

# Comando para iniciar o Icecast com o arquivo de configuração copiado
CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]
