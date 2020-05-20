FROM debian:buster-slim

RUN \
    apt-get update -y && apt-get install curl -y && \
    cd / && curl -sSOL https://github.com/cdr/code-server/releases/download/v3.3.1/code-server_3.3.1_amd64.deb && \
    dpkg -i code-server_3.3.1_amd64.deb && \
    rm code-server_3.3.1_amd64.deb
    
EXPOSE 8080