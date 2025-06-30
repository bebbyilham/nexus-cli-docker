FROM ubuntu:24.04

RUN apt update && apt install -y curl wget unzip moreutils

# Install CLI
RUN curl https://cli.nexus.xyz/ | sh

# Tambahkan path manual
ENV PATH="/root/.nexus/bin:$PATH"

# Jalankan node + log waktu
CMD ["sh", "-c", "nexus-network start --node-id $NODE_ID 2>&1 | ts '[%Y-%m-%d %H:%M:%S]' >> /root/nexus.log"]
