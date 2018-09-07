# 예 9-18. awk에게 간접 참조를 넘기기
#!/bin/bash

# "column totaler" 스크립트의 다른 버전으로
# 간접 참조를 사용해서,
# 대상 파일에서 지정된 컬럼을 모두 더해 줍니다.

ARGS=2
E_WRONGARGS=65

if [ $# -ne "$ARGS" ] # 명령어줄 인자 갯수 체크.
then
   echo "사용법: `basename $0` filename column-number"
   exit $E_WRONGARGS
fi

filename=$1
column_number=$2

#===== 여기까지는 원래 스크립트와 똑같네요. =====#


# 여러줄짜리 awk 스크립트는 awk ' ..... '  라고 하면 됩니다.


# awk 스크립트 시작.
# ------------------------------------------------
awk "

{
    total += \$${column_number} # 간접 참조
}
END {
    print total
}

" "$filename"
# ------------------------------------------------
# awk 스크립트 끝.

# 변수 간접 참조는 쉘 스크립트 안에서 awk 스크립트를 쓸 때 
# 쉘 변수 참조시 까다로운 여러가지를 피하게 해 줍니다.
# Thanks, Stephane Chazelas.


exit 0
