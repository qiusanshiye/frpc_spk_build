#!/bin/sh

SCRIPTPATH="${0%/*}"
cd ${SCRIPTPATH}
APPPATH="$(pwd)"
APPNAME="frpc_" # char:_ should be set
MONINAME="frpc_monitor"

_start() {
    owpid="$(ps -ef | grep ${APPNAME} | grep -v 'grep' | awk '{print $2}')"
    if [ -z "${owpid}" ]; then
        MONIPATH="${APPPATH}/bin/${MONINAME}"
        /bin/sh ${MONIPATH} > /dev/null 2>&1 &
    fi
}

_start
exit 0
