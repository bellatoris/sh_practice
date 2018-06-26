#!/bin/bash

# ${parameter}
# 변수인 parameter의 값이란 뜻으로서, $parameter라고 한 것과 같습니다.
# 어떤 문맥에서는 ${parameter}라고 확실히 써 줘야 동작하는 수도 있습니다.
# 문자열 변수들을 연결할 때 쓰일 수 있습니다.

your_id=${USER}-on-${HOSTNAME}
echo "$your_id"
#
echo "Old \$PATH = $PATH"
PATH=${PATH}:/opt/bin  # 스크립트가 도는 동안 $PATH 에 /opt/bin 을 추가.
echo "New \$PATH = $PATH"

# ${parameter-default}
# 매개변수가 세트되지 않았다면 default를 사용합니다.

echo ${username-$(whoami)}
# $username이 여전히 세트되어 있지 않다면 `whoami`의 결과를 에코.
# 참고: 이렇게 하면 ${parameter:-default}라고 하는 것과 거의 비슷하지만 :이 있을 때는 매개변수가 선언만 되어 값이 널일 경우에도 기본값을 적용시킵니다.

#!/bin/bash
username0=
# username0 는 선언만 되고 널로 세트됐습니다.
echo "username0 = ${username0-`whoami`}"
# 에코 되지 않습니다.

echo "username1 = ${username1-`whoami`}"
# username1 는 선언되지 않았습니다.
# 에코 됩니다.

username2=
# username2 는 선언만 되고 널고 세트됐습니다.
echo "username2 = ${username2:-`whoami`}"
# 조건 테스트시 - 가 아니고 :- 를 썼기 때문에 에코 됩니다.

# ${parameter=default}, ${parameter:=default}
# 매개변수가 세트 되어 있지 않다면 기본값으로 세트.
# 두 형태는 거의 비슷하지만 :이 있을 때는 위의 경우처럼 $parameter가 선언만 되고 값이 널일 경우에도 기본값으로 세트 시킨다는 차이점이 있습니다 [1]

echo ${username=`whoami`}
# "username" 변수를 `whoami`의 결과로 세트.

# ${parameter+alt_value}, ${parameter:+alt_value}
# 매개변수가 세트되어 있다면 alt_value를 쓰고 아니라면 널 스트링을 씁니다.
# 이 두 형태는 거의 비슷하지만 parameter가 선언되고 널일 경우에 :이 있고 없고의 차이가 나타납니다. 아래를 보세요.

echo "###### \${parameter+alt_value} ########"
echo

a=${param1+xyz}
echo "a = $a"      # a =

param2=
a=${param2+xyz}
echo "a = $a"      # a = xyz

param3=123
a=${param3+xyz}
echo "a = $a"      # a = xyz

echo
echo "###### \${parameter:+alt_value} ########"
echo

a=${param4:+xyz}
echo "a = $a"      # a =

param5=
a=${param5:+xyz}
echo "a = $a"      # a =
# a=${param5+xyz}    와 결과가 다르죠?

param6=123
a=${param6+xyz}
echo "a = $a"      # a = xyz

# ${parameter?err_msg}, ${parameter:?err_msg}
# 매개변수가 세트되어 있으면 그 값을 쓰고 아니라면 err_msg를 출력.
# 두 형태도 역시 비슷하지만 :은 parameter가 선언만 되고 널일 경우에만 차이점이 나타납니다.
echo ${hi?hahah}     # hahah
hi=
echo ${hi?hahah}     # 공백

echo ${hello:?hahah} # hahah
hello=
echo ${hello:?hahah} # hahah
