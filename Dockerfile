FROM ubuntu:24.04

# Install dependencies
RUN apt update && apt install -y curl wget unzip moreutils

# Install Nexus CLI
RUN curl https://cli.nexus.xyz/ | sh

# Tambahkan PATH langsung
ENV PATH="/root/.nexus/bin:$PATH"

# Verifikasi & jalankan nexus-network CLI dengan log timestamp
CMD ["sh", "-c", "ls -l /root/.nexus/bin && which nexus-network && nexus-network start --node-id $NODE_ID 2>&1 | ts '[%Y-%m-%d %H:%M:%S]' >> /root/nexus.log"]
