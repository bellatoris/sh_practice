#!/bin/bash

a=24
b=47

if [ "$a" -eq 24 ] && [ "$b" -eq 47 ]
then
  echo "첫번째 테스트 성공."
else
  echo "첫번째 테스트 실패."
fi

# 에러:    if [ "$a" -eq 24 && "$b" -eq 47 ]
#          라고 하면 ' [ "$a" -eq 24 ' 를 실행시키려고 하기 때문에
#          해당하는 ']' 를 찾지 못해 에러가 납니다.
#
#    if [[ $a -eq 24 && $b -eq 24 ]]   라고 하면 되겠죠.
#    (6번째 줄과 17번째 줄의 "&&" 는 다른 뜻을 갖습니다.)
#    Thanks, Stephane Chazelas.


if [ "$a" -eq 98 ] || [ "$b" -eq 47 ]
then
  echo "두번째 테스트 성공."
else
  echo "두번째 테스트 실패."
fi


# 복합문 조건 테스트에서는 -a 와 -o 옵션을 쓸 수도 있습니다.
# 이 점을 지적해준 Patrick Callahan 에게 감사합니다.


if [ "$a" -eq 24 -a "$b" -eq 47 ]
then
  echo "세번째 테스트 성공."
else
  echo "세번째 테스트 실패."
fi


if [ "$a" -eq 98 -o "$b" -eq 47 ]
then
  echo "네번째 테스트 성공."
else
  echo "네번째 테스트 실패."
fi


a=rhino
b=crocodile
if [ "$a" = rhino ] && [ "$b" = crocodile ]
then
  echo "다섯번째 테스트 성공."
else
  echo "다섯번째 테스트 실패."
fi

exit 0
