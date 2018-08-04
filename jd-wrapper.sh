#!/bin/bash

JDDIR=$XDG_DATA_HOME/jdownloader
JDSETUP=$XDG_CACHE_HOME/JD2Setup.sh
JDDWNLDFLDR="$(xdg-user-dir DOWNLOAD)/JDownloader"
JDGENSETJSON="${XDG_DATA_HOME}/jdownloader/cfg/org.jdownloader.settings.GeneralSettings.json"

if [ ! -f $JDDIR/JDownloader.jar ]; then
    install -Dm755 /app/extra/JD2Setup.sh $JDSETUP
    $JDSETUP -q -dir $JDDIR/tmp | zenity --progress --text="Installing JDownloader" --pulsate --no-cancel --auto-close
    mv $JDDIR/tmp/JDownloader.jar $JDDIR
    rm -rf $JDSETUP $JDDIR/tmp
    zenity --info --text "Download directory: ${JDDWNLDFLDR}" --no-wrap --title "JDownloader"
fi

## Change wrong path ~/Downloads to the new one. 
if [ -f ${JDGENSETJSON} ]; then
    sed -i s+\"$(xdg-user-dir DOWNLOAD)\"+\"${JDDWNLDFLDR}\"+g "${JDGENSETJSON}"
    sed -i s+\"/home/${USER}/Downloads\"+\"${JDDWNLDFLDR}\"+g "${JDGENSETJSON}"
fi

java -jar $JDDIR/JDownloader.jar
