#!/bin/bash

JDDIR=${XDG_DATA_HOME}/jdownloader

if [ ! -f ${JDDIR}/JDownloader.jar ] || ! jar -tvf ${JDDIR}/JDownloader.jar > /dev/null 2>&1; then
    rm -f ${JDDIR}/Core.jar
    rm -rf ${JDDIR}/update ${JDDIR}/tmp
    mkdir -p ${JDDIR}
    cp /app/extra/JDownloader.jar ${JDDIR}/
fi

exec java -jar ${JDDIR}/JDownloader.jar "${@}"
