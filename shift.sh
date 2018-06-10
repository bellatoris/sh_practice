#!/bin/bash
# 'shift' 로 모든 위치 매개변수를 처리하기.

# 이 스크립트의 이름을 shft 등의 이름으로 바꾸고
# ./shift.sh a b c def 23 skidoo
# 같은 식으로 몇 개의 인자를 넘겨서 불러 보세요.

until [ -z "$1" ]  # 모든 매개변수를 다 쓸 때까지...
do
  echo -n "$1 "
  shift
done

# while [ -n "$1" ]
# do
#   echo -n "$1 "
#   shift
# done

echo   # 여분의 한 줄.

exit 0
