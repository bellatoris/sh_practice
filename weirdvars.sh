#!/bin/bash
# weirdvars.sh: 이상한 변수 에코하기.

var="'(]\\{}\$\""
echo $var        # '(]\{}$"
echo "$var"      # '(]\{}$"     차이가 없죠?

echo

IFS='\'
echo $var        # '(] {}$"     \ 가 빈 칸으로 바뀌었네요.
echo "$var"      # '(]\{}$"

# S.C. 제공

# 참고: 작은 따옴표안에서는 이스케이프 문자(\)도 글자 그대로 인식되기 때문에
# 작은 따옴표로 묶인 문자열에 \을 써서 작은 따옴표 자체를 넣으려고 한다면
# 원하는 결과가 나오지 않습니다.
echo "Why can't I write 's between single quotes"

echo
# 간접적인 방법
echo 'Why can'\''t I write '"'"'s between single quotes'
#    |-------|  |----------|   |-----------------------|
# 이스케이프와 큰 따옴표로 쿼우트된 작은 따옴표에 의해 3개의 문자열로 나뉘어져 있습니다.

# Stephane Chazelas 제공.

exit 0
