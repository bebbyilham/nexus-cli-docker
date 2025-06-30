FROM ubuntu:24.04

# Install dependencies
RUN apt update && apt install -y curl build-essential pkg-config libssl-dev git moreutils

# Install nexus-cli
RUN curl -fsSL https://cli.nexus.xyz/ | bash

# Jalankan node dengan log + timestamp, gunakan path absolut
CMD ["sh", "-c", "/root/.nexus/bin/nexus-cli start --node-id $NODE_ID 2>&1 | ts '[%Y-%m-%d %H:%M:%S]' >> /root/nexus.log"]
