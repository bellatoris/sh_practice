#!/bin/bash

# 변수: 할당과 치환

a=375
hello=$a

#-------------------------------------------------------------------------
# 변수를 초기화 할 때, = 양쪽에는 빈 칸이 들어가면 안 됩니다.

#  "VARIABLE =value" 라고 하면,
#+ 스크립트는 "VARIABLE" 명령어가 "=value"란 인자를 갖는것처럼 인식합니다.

#  "VARIABLE= value" 라고 하면,
#+ 스크립트는 "value" 명령어가 환경변수 "VARIABLE"을 ""로 세팅해서 
#+ 실행되는 것으로 인식합니다.
#-------------------------------------------------------------------------


echo hello    # 변수 참조가 아니고 그냥 "hello"란 문자열입니다.

echo $hello
echo ${hello} # 위와 똑같습니다.

echo "$hello"
echo "${hello}"

echo

hello="A B  C   D"
echo $hello
echo "$hello"
# 이제 echo $hello 와 echo "$hello" 는 다른 결과가 나옵니다.
# 변수를 쿼우팅해주면 공백문자가 보존됩니다.

echo

echo '$hello'
#  작은 따옴표로 변수를 쿼우팅해주면 "$"가 문자 그대로 해석되기 때문에
#+ 변수 참조가 일어나지 않습니다.

# 쿼우팅의 종류에 따라 달라지는 결과에 주목하세요.


hello=    # 널 값을 갖도록 세팅.
echo "\$hello (널 값) = $hello"
#  변수를 널 값으로 세팅하는 것과 unset 하는 것은 비록 결과는 같지만
#+ 엄연히 다릅니다(다음 참조).

# --------------------------------------------------------------

#  여러 변수들을 공백문자로 구분해서 한 줄에서 세트할 수 있습니다.
#  하지만 이렇게 하면 코드의 가독성이 떨어지고 
#+ 다른 시스템으로 이식할 수가 없을 수도 있기 때문에 조심해서 써야 됩니다.

var1=variable1  var2=variable2  var3=variable3
echo
echo "var1=$var1   var2=$var2  var3=$var3"

# 예전 버전의 "sh"에서는 문제가 생길수도 있습니다.

# --------------------------------------------------------------

echo; echo

numbers="one two three"
other_numbers="1 2 3"
# 변수에 공백문자가 들어 있다면 쿼우팅을 해줘야 합니다.
echo "numbers = $numbers"
echo "other_numbers = $other_numbers"
echo

echo "uninitialized_variable = $uninitialized_variable"
# 초기화 안 된 변수는 널 값을 갖습니다(아무 값도 없습니다).
uninitialized_variable=   #  선언만 하고 초기화 안함.
                          #+ (위에서처럼 널 값으로 세팅한 것과 똑같음).
echo "uninitialized_variable = $uninitialized_variable"
                          # 여전히 널 값을 갖고 있네요.

uninitialized_variable=23       # 세트.
unset uninitialized_variable    # 언세트.
echo "uninitialized_variable = $uninitialized_variable"
                                # 여전히 널 값입니다.

echo

exit 0
