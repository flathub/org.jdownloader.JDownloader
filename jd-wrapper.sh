#!/bin/bash

JDDIR=${XDG_DATA_HOME}/jdownloader

if ! jar -tvf ${JDDIR}/JDownloader.jar > /dev/null 2>&1; then
    rm -rf ${JDDIR}/JDownloader.jar ${JDDIR}/Core.jar ${JDDIR}/update ${JDDIR}/tmp 2>/dev/null
    mkdir -p ${JDDIR}
    install -Dm644 /app/extra/JDownloader.jar ${JDDIR}
fi

exec java -jar ${JDDIR}/JDownloader.jar "${@}"
