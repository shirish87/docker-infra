#!/bin/bash -e

[[ -z "${PRODUCT_DB_USER}" ]] && { echo "env PRODUCT_DB_USER does not exist."; exit 0; }
[[ -z "${PRODUCT_DB_PASSWORD}" ]] && { echo "env PRODUCT_DB_PASSWORD does not exist."; exit 0; }
[[ -z "${PRODUCT_DB}" ]] && { echo "env PRODUCT_DB does not exist."; exit 0; }

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER ${PRODUCT_DB_USER} WITH PASSWORD '${PRODUCT_DB_PASSWORD}';
    CREATE DATABASE ${PRODUCT_DB};
    GRANT ALL PRIVILEGES ON DATABASE ${PRODUCT_DB} TO ${PRODUCT_DB_USER};
EOSQL
