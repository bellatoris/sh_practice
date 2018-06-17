# 쉘 스크립트는 특별한 접두사나 표기법이 없다면 숫자를 10진수로 해석합니다.
# 만약에 숫자 앞에 0이 있다면 8진수 (8진법)고, 0x이 있으면 16진수(16진법)입니다.
# #이 들어간 숫자는 진법#숫자로 계산됩니다(이 옵션은 범위 제한이 있기 때문에 유용하지 않습니다).

# 10진수
let "d = 32"
echo "d = $d"
# 별로 특별한 게 없네요.


# 8진수: '0' 다음에 나오는 숫자
let "o = 071"
echo "o = $o"
# 결과는 10진수로 나타납니다.

# 16진수: '0x'나 '0X' 다음에 나오는 숫자
let "h = 0x7a"
echo "h = $h"
# 결과는 10진수로 나타납니다.

# 다른 진법: 진수#숫자
# 진수는 2 와 36 사이가 올 수 있습니다.
let "b = 32#77"
echo "b = $b"
#
# 이 표기법은 아주 제한된 범위의 숫자(2 - 36)에서만 동작합니다.
                # ... 10 개의 숫자 + 26 개의 알파벳 문자 = 36.
let "c = 2#47"  # 범위 초과 에러:
# numbers.sh: let: c = 2#47: value too great for base (error token is "2#47")
echo "c = $c"

echo

echo $((36#zz)) $((2#10101010)) $((16#AF16))

exit 0
# 자세한 설명 고마워요. S.C.
