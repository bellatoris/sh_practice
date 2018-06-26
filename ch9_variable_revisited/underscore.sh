#예 9-8. 밑줄 변수(underscore variable)
##!/bin/bash
echo $_         # /bin/bash
# 스크립트를 돌리기 위해 실행된 /bin/bash. 

du >/dev/null   # 명령어 출력이 없음.
echo $_         # du

ls -al          # 명령어 출력이 없음.
echo $_         # -al  (마지막 인자)

:
echo $_         # :
