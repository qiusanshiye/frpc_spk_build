#!/bin/sh

SCRIPTPATH="${0%/*}"
cd ${SCRIPTPATH}
APPPATH="$(pwd)"
APPNAME="frpc"

_stop() {
    ps -ef | grep ${APPNAME}| grep -v 'stop' | grep -v 'grep' | awk '{print $2}' | xargs kill -9
}

_stop
_stop
exit 0
