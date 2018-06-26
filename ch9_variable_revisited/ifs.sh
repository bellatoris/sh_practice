#!/bin/bash
# $IFS 는 공백문자를 다른 문자들과 다르게 처리합니다.

output_args_one_per_line()
{
  for arg
  do echo "[$arg]"
  done
}

echo; echo "IFS=\" \""
echo "-------"

IFS=" "
var=" a  b c   "
output_args_one_per_line $var  # output_args_one_per_line `echo " a  b c   "`
#
# [a]
# [b]
# [c]


echo; echo "IFS=:"
echo "-----"

IFS=:
var=":a::b:c:::"               # 위와 같지만 ":" 를 " "로 바꿔줍니다.
output_args_one_per_line $var
#
# []
# [a]
# []
# [b]
# [c]
# []
# []
# []

# awk 의 "FS" 필드 구분자도 위와 같은 동작을 합니다.

# Thank you, Stephane Chazelas.

echo

exit 0
