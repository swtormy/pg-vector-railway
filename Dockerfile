FROM ghcr.io/railwayapp-templates/postgres-ssl:15

RUN apt-get update && apt-get install -y \
    git \
    gcc \
    make \
    postgresql-server-dev-15 \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/pgvector/pgvector.git /pgvector
WORKDIR /pgvector
RUN make && make install

