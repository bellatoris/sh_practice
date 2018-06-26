# 경고
# $*과 $@은 가끔 $IFS의 설정값에 따라 일관성이 없고 이상한 동작을 합니다.
# 예 9-6. 일관성 없는 $*과 $@의 동작

#!/bin/bash

# 쿼우트 여부에 따라 이상하게 동작하는 
# Bash 내부 변수 "$*"와 "$@".
# 낱말 조각남과 라인피드가 일관성 없이 처리됩니다.

# 이 예제 스크립트는 Stephane Chazelas 가 제공하고,
# 본 문서의 저자가 약간 수정했습니다.


set -- "첫번째 인자" "두번째" "세번째:인자" "" "네번째: :인자"
# 스크립트의 인자를 $1, $2 등으로 세팅.

echo

echo 'IFS 는 그대로, "$*"'
c=0
for i in "$*"               # 쿼우트
do echo "$((c+=1)): [$i]"   # 매 인스턴스마다 똑같음.
                            # 인자 에코.
done
echo ---

echo 'IFS 는 그대로, $*'
c=0
for i in $*                 # 쿼우트 안 함
do echo "$((c+=1)): [$i]"
done
echo ---

echo 'IFS 는 그대로, "$@"'
c=0
for i in "$@"
do echo "$((c+=1)): [$i]"
done
echo ---

echo 'IFS 는 그대로, $@'
c=0
for i in $@
do echo "$((c+=1)): [$i]"
done
echo ---

IFS=:
echo 'IFS=":", "$*"'
c=0
for i in "$*"
do echo "$((c+=1)): [$i]"
done
echo ---

echo 'IFS=":", $*'
c=0
for i in $*
do echo "$((c+=1)): [$i]"
done
echo ---

var=$*
echo 'IFS=":", "$var" (var=$*)'
c=0
for i in "$var"
do echo "$((c+=1)): [$i]"
done
echo ---

echo 'IFS=":", $var (var=$*)'
c=0
for i in $var
do echo "$((c+=1)): [$i]"
done
echo ---

var="$*"
echo 'IFS=":", $var (var="$*")'
c=0
for i in $var
do echo "$((c+=1)): [$i]"
done
echo ---

echo 'IFS=":", "$var" (var="$*")'
c=0
for i in "$var"
do echo "$((c+=1)): [$i]"
done
echo ---

echo 'IFS=":", "$@"'
c=0
for i in "$@"
do echo "$((c+=1)): [$i]"
done
echo ---

echo 'IFS=":", $@'
c=0
for i in $@
do echo "$((c+=1)): [$i]"
done
echo ---

var=$@
echo 'IFS=":", $var (var=$@)'
c=0
for i in $var
do echo "$((c+=1)): [$i]"
done
echo ---

echo 'IFS=":", "$var" (var=$@)'
c=0
for i in "$var"
do echo "$((c+=1)): [$i]"
done
echo ---

var="$@"
echo 'IFS=":", "$var" (var="$@")'
c=0
for i in "$var"
do echo "$((c+=1)): [$i]"
done
echo ---

echo 'IFS=":", $var (var="$@")'
c=0
for i in $var
do echo "$((c+=1)): [$i]"
done

echo

# 이 스크립트를 ksh 이나 zsh -y 로 실행해 보세요.

exit 0
