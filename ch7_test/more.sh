#!/bin/bash

# 'most'로 gzip으로 묶인 파일을 보기

NOARGS=65
NOTFOUND=66
NOTGZIP=67

if [ $# -eq 0 ] # if [ -z "$1" ] 라고 해도 같음
# $1 이 존재하지만 비어 있을 수 있습니다:  zmost "" arg2 arg3
then
  echo "사용법: `basename $0` filename" >&2
  # 표준에러로 에러 메세지를 출력.
  exit $NOARGS
  # 스크립트의 종료 코드(에러 코드)로 65를 리턴.
fi  

filename=$1

if [ ! -f "$filename" ]   # $filename 에 빈 칸이 들어 있을 수도 있기 때문에 쿼우팅해줍니다.
then
  echo "$filename 파일을 찾을 수 없습니다!" >&2
  # 표준출력으로 에러 메세지를 출력.
  exit $NOTFOUND
fi  

echo "${filename##*.}"

if [ ${filename##*.} != "gz" ]
# 변수 치환인 중괄호를 사용함.
then
  echo "$1 파일은 gzip 파일이 아닙니다!"
  exit $NOTGZIP
fi  

zcat < $1 | more

# 'most' 파일 뷰어 쓰기('less'와 비슷).
# 'more'나 'less'로 바꿔도 괜찮음.


exit $?   # 파이프의 종료 상태를 리턴.
#  스크립트는 어떤 경우든지간에 마지막에 실행된 명령어의 종료 상태를 
#+ 리턴하기 때문에 실제로는 "exit $?"가 필요없습니다.
