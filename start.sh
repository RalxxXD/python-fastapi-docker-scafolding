#!/bin/bash
if [ -z "$DEVELOPER_MODE" ]
then
    echo "\$NEW_RELIC_DEVELOPER_MODE is empty"
    gunicorn 'main:main()' --bind 0.0.0.0:${SERVICE_PORT} -k uvicorn.workers.UvicornWorker --preload --workers=${GUNICORN_WORKER} --threads=${GUNICORN_THREADS} --timeout=${GUNICORN_TIMEOUT}
else
    echo "\$NEW_RELIC_DEVELOPER_MODE is NOT empty"
    uvicorn --reload --host 0.0.0.0 --port ${SERVICE_PORT} main:main
fi