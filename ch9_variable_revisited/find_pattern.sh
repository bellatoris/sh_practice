# ${var/#patt/replacement}
# var의 접두어(prefix)가 patt과 일치하면 patt을 replacement로 치환.

# ${var/%patt/replacement}
# var의 접미어(suffix)가 patt과 일치하면 patt을 replacement로 치환.

# 예 9-15. 문자열의 접두, 접미어에서 일치하는 패턴 찾기

#!/bin/bash
# 문자열의 접두어/접미어 에서 패턴 치환 하기.

v0=abc1234zip1234abc    # 원래 변수.
echo "v0 = $v0"         # abc1234zip1234abc
echo

# 문자열의 접두어(시작)에서 일치.
v1=${v0/#abc/ABCDEF}    # abc1234zip1234abc
                        # |-|
echo "v1 = $v1"         # ABCDE1234zip1234abc
                        # |---|

# 문자열의 접미어(끝)에서 일치.
v2=${v0/%abc/ABCDEF}    # abc1234zip123abc
                        #              |-|
echo "v2 = $v2"         # abc1234zip1234ABCDEF
                        #               |----|

echo

#  ----------------------------------------------------
#  문자열의 시작과 끝에서 일치가 일어나야지만
#+ 대치가 일어납니다.
#  ----------------------------------------------------
v3=${v0/#123/000}       # 일치하지만 시작 부분이 아닙니다.
echo "v3 = $v3"         # abc1234zip1234abc
                        # *대치가 안 일어납니다*.
v4=${v0/%123/000}       # 일치하지만 끝 부분이 아닙니다.
echo "v4 = $v4"         # abc1234zip1234abc
                        # *대치가 안 일어납니다*.

# ${!varprefix*}, ${!varprefix@}
# 이미 선언된 변수들 중에 varprefix로 시작하는 변수들.

xyz23=whatever
xyz24=

a=${!xyz*}      # 선언된 변수중 "xyz"로 시작하는 변수로 확장.
echo "a = $a"   # a = xyz23 xyz24
a=${!xyz@}      # 위와 같음.
echo "a = $a"   # a = xyz23 xyz24

# Bash 2.04 버전에서 이 기능이 추가됨.
