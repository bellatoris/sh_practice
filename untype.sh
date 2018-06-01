#!/bin/bash
# int-or-string.sh
# 정수? 문자열?

a=2334                   # 정수.
let "a += 1"
echo "a = $a "           # 여전히 정수죠.
echo

b=${a/23/BB}             # 문자열로 변환.
echo "b = $b"            # BB35
declare -i b             # 정수로 선언해도 도움이 되질 않죠.
echo "b = $b"            # 여전히 BB35.

let "b += 1"             # BB35 + 1 =
echo "b = $b"            # 1
echo

c=BB34
echo "c = $c"            # BB34
d=${c/BB/23}             # 정수로 변환.
echo "d = $d"            # 2334
let "d += 1"             # 2334 + 1 =
echo "d = $d"            # 2335

# Bash 의 변수는 본질적으로 타입이 없습니다(untyped).

exit 0
