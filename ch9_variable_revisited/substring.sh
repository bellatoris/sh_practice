# 변수 길이/문자열조각(substring) 삭제
# ${#var}
# 문자열 길이 ($var의 문자 갯수). 배열의 경우에, ${#array}라고 하면 배열의 첫번째 요소의 길이를 알려줍니다.
#     참고: 예외:
#         ${#*} 와 ${#@} 는 위치 매개변수의 갯수를 알려줍니다.
#         배열에 대해 ${#array[*]} 나 ${#array[@]} 라고 하면 배열 요소의 갯수를 알려줍니다. 
# 예 9-11. 변수의 길이

#!/bin/bash
# length.sh

E_NO_ARGS=65

if [ $# -eq 0 ]  # 이 스크립트에서는 명령어줄 인자가 필요합니다.
then
  echo "하나 이상의 명령어줄 인자가 필요합니다."
  exit $E_NO_ARGS
fi  

var01=abcdEFGH28ij

echo "var01 = ${var01}"
echo "var01 의 길이 = ${#var01}"

echo "스크립트로 넘어온 명령어줄 인자 갯수 = ${#@}"
echo "스크립트로 넘어온 명령어줄 인자 갯수 = ${#*}"


# ${var#pattern}, ${var##pattern}
# $pattern이 $var의 앞 부분과 가장 짧거나 가장 길게 일치하는 부분을 삭제.
# 예 A-6에서 발췌한 사용법 예제:

# "days-between.sh" 예제에서 쓰인 함수.
# 주어진 인자의 앞 부분에 들어있는 하나 이상의 0 을 삭제.

strip_leading_zero () # 날짜나 월의 앞 부분에 나오는 0을 삭제하지 않으면 
{                     # Bash 가 8진수로 해석하기 때문에(POSIX.2, sect 2.9.2.1)
  val=${1#0}          # 이렇게 해 주는게 좋습니다.
  return $val
}

# 다른 사용법 예제:

echo `basename $PWD`        # 현재 디렉토리의 basename.
echo "${PWD##*/}"           # 현재 디렉토리의 basename.
echo
echo `basename $0`          # 스크립트 이름.
echo $0                     # 스크립트 이름.
echo "${0##*/}"             # 스크립트 이름.
echo
filename=test.data
echo "${filename##*.}"      # 데이타
                            # 전체 파일이름에서 확장자.

# ${var%pattern}, ${var%%pattern}
# $pattern이 $var의 뒷 부분과 가장 짧거나 가장 길게 일치하는 부분을 삭제. 
