FROM ubuntu:24.04

# Install dependencies
RUN apt update && apt install -y curl wget unzip moreutils

# Buat folder nexus dan download zip CLI secara manual
WORKDIR /root
RUN mkdir -p .nexus && \
    curl -L https://cli-releases.nexus.xyz/nexus-cli-linux.zip -o nexus-cli.zip && \
    unzip nexus-cli.zip -d .nexus/bin && \
    chmod +x .nexus/bin/nexus-network && \
    rm nexus-cli.zip

# Tambahkan PATH
ENV PATH="/root/.nexus/bin:$PATH"

# Jalankan node dan log dengan timestamp
CMD ["sh", "-c", "nexus-network start --node-id $NODE_ID 2>&1 | ts '[%Y-%m-%d %H:%M:%S]' >> /root/nexus.log"]
