#!/bin/bash

func1 ()
{
echo 여기는 함수에요.
}

declare -f        # 위 함수를 나열.

echo

declare -i var1   # var1 은 정수.
var1=2367
echo "var1 은 $var1 로 선언됐습니다."
var1=var1+1       # 정수 선언은 'let' 이 필요없습니다.
echo "1이 증가된 var1 은 $var1 입니다."
# Attempt to change variable declared as integer
echo "var1을 부동형 값인 2367.1 로 바꾸려는 시도."
var1=2367.1       # 에러 메세지를 내고 값은 변하지 않습니다.
echo "var1 은 여전히 $var1 입니다."

echo

declare -r var2=13.36         # 'declare' 는 변수 타입을 설정하고 동시에 
                              #+ 그 값을 할당할 수 있게 해 줍니다.
echo "var2 는 $var2 로 선언됐습니다." # 읽기 전용 변수 값을 변경하려는 시도.
var2=13.37                    # 에러 메세지를 내고 스크립트 종료.

echo "var2 는 여전히 $var2 입니다."    # 여기는 실행되지 않을 것입니다.

exit 0                        # 여기서 종료되지 않습니다.
