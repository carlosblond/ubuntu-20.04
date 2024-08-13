# Use a imagem oficial do Ubuntu 20.04
FROM ubuntu:20.04

# Defina a variável de ambiente para não pedir interações durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Atualizar os pacotes e instalar utilitários essenciais
RUN apt-get update && apt-get install -y \
    curl \
    vim \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Defina o diretório de trabalho
WORKDIR /app

# Copiar os arquivos da sua aplicação para o container
COPY . .

# Defina o comando a ser executado quando o container iniciar
CMD ["bash"]
