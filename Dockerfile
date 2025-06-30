FROM ubuntu:24.04

# Install dependencies
RUN apt update && apt install -y curl wget unzip moreutils

# Install Nexus CLI
RUN curl https://cli.nexus.xyz/ | sh && \
    echo 'export PATH=$HOME/.nexus/bin:$PATH' >> ~/.bashrc && \
    echo 'export PATH=$HOME/.nexus/bin:$PATH' >> ~/.profile

ENV PATH="/root/.nexus/bin:$PATH"

# Jalankan node CLI + log timestamp
CMD ["sh", "-c", "nexus-network start --node-id $NODE_ID 2>&1 | ts '[%Y-%m-%d %H:%M:%S]' >> /root/nexus.log"]
