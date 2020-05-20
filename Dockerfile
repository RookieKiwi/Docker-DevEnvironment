FROM debian:buster-slim
ENV PATH="/usr/lib/code-server/bin:${PATH}"

RUN \
    apt-get update -y && apt-get install curl -y && \
    cd / && curl -sSOL https://github.com/cdr/code-server/releases/download/v3.3.1/code-server_3.3.1_amd64.deb && \
    dpkg -i code-server_3.3.1_amd64.deb && \
    rm code-server_3.3.1_amd64.deb
    
EXPOSE 31337

CMD ["code-server --auth none --bind-addr 0.0.0.0:31337"]
