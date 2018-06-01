#!/bin/bash

LOG_DIR=/var/log
ROOT_UID=0
LINES=50
E_XCD=66
E_NOTROOT=67


if [ "$UID" -ne "$ROOT_UID" ]; then
    echo "이 스크립트는 루트로 실행시켜야 합니다."
    exit $E_NOTROOT
fi

if [ -n "$1" ]; then
    lines=$1
else
    lines=$LINES
fi

cd $LOG_DIR

if [ $(pwd) != "$LOG_DIR" ]; then
    echo "$LOG_DIR 로 옮겨갈 수 없습니다."
    exit $E_XCD
fi

tail -n $lines messages > mesg.temp
mv mesg.temp messages

cat /dev/null > wtmp
echo "로그가 정리됐습니다."

exit 0
