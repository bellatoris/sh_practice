#!/bin/bash

# ripe.net, cw.net, radb.net 중 하나의 서버에 대해서 
# 'whois domain-name' 룩업을 실행

# 이 스크립트 이름을 'wh' 라고 해서 /usr/local/bin 에 넣어두세요.

# 그리고 다음처럼 심볼릭 링크를 거세요.
# ln -s /usr/local/bin/wh /usr/local/bin/wh-ripe
# ln -s /usr/local/bin/wh /usr/local/bin/wh-cw
# ln -s /usr/local/bin/wh /usr/local/bin/wh-radb


if [ -z "$1" ]
then
  echo "사용법: `basename $0` [domain-name]"
  exit 65
fi

case `basename $0` in
# 스크립트 이름을 확인해서 해당 서버를 부릅니다.
    "wh"     ) whois $1@whois.ripe.net;;
    "wh-ripe") whois $1@whois.ripe.net;;
    "wh-radb") whois $1@whois.radb.net;;
    "wh-cw"  ) whois $1@whois.cw.net;;
    *        ) echo "사용법: `basename $0` [domain-name]";;
esac 

exit 0
