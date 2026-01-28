FROM mysql:8.0

ENV MYSQL_ROOT_PASSWORD=secure_stage_2026

COPY ./scripts/setup.sql /docker-entrypoint-initdb.d/