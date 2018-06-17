# 예 7-5. 문자열이 널인지 테스트 하기

#!/bin/bash
# str-test.sh: Testing null strings and unquoted strings,
# but not strings and sealing wax, not to mention cabbages and kings...
# (옮긴이: ??? :)

# if [ ... ]  를 쓸께요.


#  문자열이 초기화 안 됐다면 정해진 값을 갖지 않는데
#+ 이런 상태를 "널"(null)이라고 부릅니다(0 과는 다릅니다).

if [ -n $string1 ]    # $string1 은 선언도 초기화도 안 됐습니다.
then
  echo "\"string1\" 은 널이 아닙니다."
else  
  echo "String \"string1\" 은 널입니다."
fi  
# 틀렸죠.
# 초기화가 안 됐는데도 널이 아닌 것으로 나오네요.


echo


# 다시 해보죠.

if [ -n "$string1" ]  # 이번엔 $string1 을 쿼우트 시켜서 해보죠.
then
  echo "\"string1\" 은 널이 아닙니다."
else  
  echo "\"string1\" 은 널입니다."
fi      # 테스트문에서는 문자열을 꼭 쿼우트 시키세요!


echo


if [ $string1 ]       # 이번엔 달랑 $string1 만 두고 해보죠.
then
  echo "\"string1\" 은 널이 아닙니다."
else  
  echo "\"string1\" 은 널입니다."
fi  
# 이건 잘 되네요.
# 문자열을 쿼우트 시키는 게("$string1") 좋은 습관이긴 하지만
# [ ] 테스트 연산자는 혼자 쓰이면 문자열이 널인지 아닌지를 잘 알아냅니다.
#
# Stephane Chazelas 가 지적한 것처럼,
#    if [ $string 1 ]   는 인자가 "]" 하나고,
#    if [ "$string 1" ]  는 인자가 빈 "$string1"과 "]", 두 개입니다.



echo



string1=initialized

if [ $string1 ]       # , $string1 을 다시 혼자 써보죠.
then
  echo "\"string1\" 은 널이 아닙니다."
else  
  echo "\"string1\" 은 널입니다."
fi  
# 역시 결과가 맞게 잘 나오죠.
# 마찬가지로 이유로 쿼우트 해주는 것이("$string1") 좋습니다. 왜냐하면...


string1="a = b"

if [ $string1 ]       # $string1 을 또 혼자 씁니다.
then
  echo "\"string1\" 은 널이 아닙니다."
else  
  echo "\"string1\" 은 널입니다."
fi  
# 이제 "$string1"을 쿼우트 해 주지 않으면 틀린 결과가 나옵니다!

exit 0
# Florian Wisser가 날카롭게 지적해 준 것에도 감사합니다.
