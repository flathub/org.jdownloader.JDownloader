#!/bin/bash

JDDIR=${XDG_DATA_HOME}/jdownloader

if [ ! -f ${JDDIR}/JDownloader.jar ]; then
    mkdir -p ${JDDIR}
    cp /app/extra/JDownloader.jar ${JDDIR}/
fi

exec java -jar ${JDDIR}/JDownloader.jar "${@}"
