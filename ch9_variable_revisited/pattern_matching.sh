# 예 9-12. 매개변수 치환에서의 패턴 매칭
#!/bin/bash
# 매개변수 치환 연산자인 # ## % %% 를 써서 패턴 매칭하기.

var1=abcd12345abc6789
pattern1=a*c  # * (와일드 카드)는 a 와 c 사이의 모든 문자와 일치합니다.

echo
echo "var1 = $var1"           # abcd12345abc6789
echo "var1 = ${var1}"         # abcd12345abc6789   (다른 형태)
echo "${var1} 에 들어 있는 글자수 = ${#var1}"
echo "pattern1 = $pattern1"   # a*c  ('a'와 'c' 사이의 모든 문자)
echo


echo '${var1#$pattern1}  =' "${var1#$pattern1}"    #         d12345abc6789
# 앞에서부터 가장 짧게 일치하는 3 글자를 삭제             abcd12345abc6789
# ^^^^^^^^^^                                              |-|
echo '${var1##$pattern1} =' "${var1##$pattern1}"   #                  6789      
# 앞에서부터 가장 길게 일치하는 12 글자를 삭제            abcd12345abc6789
# ^^^^^^^^^^                                              |----------|

echo; echo

pattern2=b*9            # 'b'와 '9' 사이의 모든 문자.
echo "var1 = $var1"     # abcd12345abc6789 를 계속 씁니다.
echo "pattern2 = $pattern2"
echo

echo '${var1%pattern2}  =' "${var1%$pattern2}"     #     abcd12345a
# 뒤에서부터 가장 짧게 일치하는 6 글자를 삭제            abcd12345abc6789
# ^^^^^^^^^^                                                       |----|
echo '${var1%%pattern2} =' "${var1%%$pattern2}"    #     a
# 뒤에서부터 가장 길게 일치하는 12 글자를 삭제           abcd12345abc6789
# ^^^^^^^^^^                                              |-------------|

# 이렇게 외우세요.
#           # 과 ## 은 문자열의 앞쪽에서부터 동작을 하고,
#           % 와 %% 는 뒤쪽에서부터 동작을 합니다.

echo

exit 0
