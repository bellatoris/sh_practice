# 콤마 연산자(comma operator)

# 콤마 연산자는 두 개 이상의 산술 연산을 묶어 줍니다.
# 이 연산자로 묶인 모든 연산은 부효과(side effects)가 생길 가능성을 가지고 평가되고 제일 마지막 연산의 결과만 리턴됩니다.

let "t1 = ((5 + 3, 7 - 1, 15 - 4))"
echo "t1 = $t1"               # t1 = 11

let "t2 = ((a = 9, 15 / 3))"  # "a" 를 세트하고 "t2" 를 계산.
echo "t2 = $t2    a = $a"     # t2 = 5    a = 9

