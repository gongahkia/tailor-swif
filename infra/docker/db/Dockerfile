FROM postgres:15-alpine

RUN apk add --no-cache postgresql-contrib

ENV POSTGRES_DB=tailorswif
ENV POSTGRES_USER=tailorswif
ENV POSTGRES_PASSWORD=tailorswif

COPY ./initdb.d /docker-entrypoint-initdb.d