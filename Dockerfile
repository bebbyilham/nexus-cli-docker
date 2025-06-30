FROM ubuntu:24.04

RUN apt update && apt install -y curl wget unzip moreutils

RUN curl https://cli.nexus.xyz/ | sh

ENV PATH="/root/.nexus/bin:$PATH"

CMD ["sh", "-c", "nexus-network start --node-id $NODE_ID 2>&1 | ts '[%Y-%m-%d %H:%M:%S]' >> /root/nexus.log"]
