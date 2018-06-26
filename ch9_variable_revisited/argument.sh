# 예 9-5. arglist: $* 과 $@ 로 인자를 나열하기
#!/bin/bash
# 이 스크립트를 부를 때 "one two three" 같은 인자를 줘서 부르세요.

E_BADARGS=65

if [ ! -n "$1" ]
then
  echo "사용법: `basename $0` argument1 argument2 etc."
  exit $E_BADARGS
fi

echo

index=1

echo "\"\$*\" 로 인자를 나열하기:"
for arg in "$*"  # "$*" 를 쿼우트하지 않으면 제대로 동작하지 않습니다.
do
  echo "Arg #$index = $arg"
  let "index+=1"
done             # $* 는 모든 인자를 하나의 낱말로 봅니다.
echo "전체 인자 목록은 하나의 낱말로 나타납니다."

echo

index=1

echo "\"\$@\" 로 인자를 나열하기:"
for arg in "$@"
do
  echo "Arg #$index = $arg"
  let "index+=1"
done             # $@ 는 인자들을 분리된 낱말로 봅니다.
echo "전체 인자 목록은 분리된 낱말로 나타납니다."

echo

exit 0
