#!/bin/bash
set -e
if [ "$1" = 'postgres' ]; then
    chown -R postgres "$PGDATA"
if [ -z "$(ls -A "$PGDATA")" ]; then
        su-exec postgres initdb
    fi
exec su-exec postgres "$@"
fi
exec "$@"

