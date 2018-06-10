#!/bin/sh

# 최소한 10 개의 매개변수를 줘서 이 스크립트를 실행시키세요. 예를 들면,
# ./scriptname 1 2 3 4 5 6 7 8 9 10

echo

echo "스크립트 이름은 \"$0\"."
# 현재 디렉토리를 나타내는 ./ 가 추가되어 있죠.
echo "스크립트 이름은 \"`basename $0`\"."
# 경로명을 떼어 냅니다('basename' 참고).

echo

if [ -n "$1" ]              # 테스트 할 변수를 쿼우트 해줬습니다.
then
 echo "첫번째 매개변수는 $1"  # # 을 이스케이프 시키기 위해서 쿼우트를 해 줘야 됩니다.
fi 

if [ -n "$2" ]
then
 echo "두번째 매개변수는 $2"
fi 

if [ -n "$3" ]
then
 echo "세번째 매개변수는 $3"
fi 

# ...

if [ -n "${10}" ]  # $9 보다 큰 매개변수는 {중괄호}로 감싸야 됩니다.
then
 echo "열번째 매개변수는 ${10}"
fi 

echo

variable1_=$1_
# 이렇게 해주면 위치 매개 변수가 비어있더라도 에러를 막아줍니다.

critical_argument01=$variable1_

echo $critical_argument01

# 실제로 변수를 쓸 곳에서 다음처럼 해주면 에러 방지용 문자가 잘려 나갑니다.
variable1=${variable1_/_/}   # $variable1_ 이 "_"로 시작할 때만 부효과(Side effects)가 있습니다.
# 9장에서 논의할 매개변수 치환중의 한 가지 방법을 써서 변경 패턴을 삭제해 줍니다.

echo $variable1

#  좀 더 확실한 방법은 원하는 위치 매개변수가 넘어 왔는지 테스트를 해 보는 것입니다.
if [ -z $1 ]; then
  exit $POS_PARAMS_MISSING
fi  

exit 0
