FROM debian:buster-slim

COPY launcher/ /temp

RUN \
    apt-get update -y && apt-get install curl -y && \
    cd / && curl -sSOL https://github.com/cdr/code-server/releases/download/v3.3.1/code-server_3.3.1_amd64.deb && \
    dpkg -i code-server_3.3.1_amd64.deb && \
    rm code-server_3.3.1_amd64.deb && \
    cp /temp/start-code-server /bin && \
    chmod +x /bin/start-code-server
    
EXPOSE 31337

CMD ["start-code-server"]