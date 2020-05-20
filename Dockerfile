FROM debian:buster-slim

COPY launcher/ /temp

RUN \
    echo "*** Installing curl and running basic updates ***" && \
    apt-get update -y && apt-get install curl -y

RUN \
    echo "*** Downloading and installing code-server ***" && \
    cd /temp && curl -sSOL https://github.com/cdr/code-server/releases/download/v3.3.1/code-server_3.3.1_amd64.deb && \
    dpkg -i code-server_3.3.1_amd64.deb && \
    cp /temp/start-code-server /bin && \
    chmod +x /bin/start-code-server && \
    echo "*** Cleaning up, we are doneski! ***" && \
    cd / && rm -rf /temp && rm -rf /var/lib/apt/lists/*
    
EXPOSE 31337

CMD ["start-code-server"]
