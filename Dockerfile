FROM postgres:16

RUN apt-get update && apt-get install -y \
    make \
    gcc \
    git \
    postgresql-server-dev-16 \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/pgvector/pgvector.git /pgvector
WORKDIR /pgvector
RUN make && make install

ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypassword
ENV POSTGRES_DB=mydb

EXPOSE 5432
