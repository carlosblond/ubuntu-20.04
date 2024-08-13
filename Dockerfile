# Use a imagem base do Ubuntu
FROM ubuntu:20.04

# Defina a variável de ambiente para não pedir interações durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Atualizar os pacotes e instalar utilitários essenciais
RUN apt-get update && apt-get install -y \
    curl \
    vim \
    wget \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*


# Crie o diretório necessário para o SSH
RUN mkdir /var/run/sshd

# Modifique a configuração do SSH para permitir o acesso por senha
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Defina uma senha para o root (substitua 'yourpassword' por uma senha segura)
RUN echo 'root:yourpassword' | chpasswd

# Exponha a porta 22 para o SSH
EXPOSE 22

# Comando para iniciar o SSH
CMD ["/usr/sbin/sshd", "-D"]
