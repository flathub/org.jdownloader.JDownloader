#!/bin/bash

JDDIR=${XDG_DATA_HOME}/jdownloader

if ! jar -tvf ${JDDIR}/JDownloader.jar > /dev/null 2>&1; then
    rm -rf ${JDDIR}/JDownloader.jar ${JDDIR}/Core.jar ${JDDIR}/libs ${JDDIR}/extensions ${JDDIR}/jd ${JDDIR}/themes ${JDDIR}/tools ${JDDIR}/translations ${JDDIR}/licenses ${JDDIR}/update ${JDDIR}/tmp 2>/dev/null
    mkdir -p ${JDDIR}
    cp -r /app/lib/jdownloader/* ${JDDIR}/
fi

exec java -jar ${JDDIR}/JDownloader.jar "${@}"
