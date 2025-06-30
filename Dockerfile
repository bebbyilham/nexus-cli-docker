FROM ubuntu:24.04

# Install dependencies
RUN apt update && apt install -y curl build-essential pkg-config libssl-dev git golang moreutils

# Set Go environment
ENV GOPATH=/go
ENV PATH=$PATH:/go/bin

# Clone & build nexus-cli
RUN git clone https://github.com/Nexus-Protocol/nexus-cli.git /nexus-cli &&     cd /nexus-cli &&     go build -o /usr/local/bin/nexus-cli ./cmd/nexus

# Jalankan CLI dengan log + timestamp
CMD ["sh", "-c", "nexus-cli start --node-id $NODE_ID 2>&1 | ts '[%Y-%m-%d %H:%M:%S]' >> /root/nexus.log"]
