# !/bin/sh

# 변수를 참조할 때는 보통 큰 따옴표(" ")로 묶어 주는게 좋습니다.
# 이렇게 하면 $, `(backquote), \(이스케이프)를 제외한 모든 특수
# 문자들을 보존해 줍니다. 변수에 쿼우트를 걸어서("$variable")
# $을 특수 문자로 인식하게 되면 그 변수의 값으로 바꿔 줍니다.

# 낱말 조각남(word splitting) [1] 을 피하려면 큰 따옴표를 쓰기 바랍니다.
# 이렇게 하면 인자에 공백문자가 들어 있어도 하나의 낱말로 인식하게 해 줍니다.

COMMAND() {
    until [ -z "$1" ]; do
        echo $1
        shift
    done
}

variable1="4개의 낱말로 이루어진 변수"
COMMAND 이것은 $variable1 입니다.    # COMMAND는 6개의 인자를 가지고 실행됩니다.
# "이것은" "4개의" "낱말로" "이루어진" "변수" "입니다."

COMMAND "이것은 $variable1 입니다."  # COMMAND는 1개의 인자를 가지고 실행됩니다.
# "이것은 4개의 낱말로 이루어진 변수 입니다."


variable2=""    # 비어 있습니다.
COMMAND $variable2 $variable2 $variable2        # COMMAND는 인자 없이 실행됩니다.
COMMAND "$variable2" "$variable2" "$variable2"  # COMMAND는 3개의 빈 인자를 가지고 실행됩니다.
COMMAND "$variable2 $variable2 $variable2"      # COMMAND는 2개의 빈칸을 가진 하나의 인자를 가지고 실행됩니다.

# Thanks, S.C.
