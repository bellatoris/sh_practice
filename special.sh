#!/bin/bash


echo ${PATH#*:}       # 매개변수 치환으로, 주석이 아니죠.
echo $(( 2#101011 ))  # 진법 변환, 주석이 아닙니다.

variable=abc

case "$variable" in
abc)  echo "$variable = abc" ;;
xyz)  echo "$variable = xyz" ;;
esac

let "t2 = ((a = 9, 15 / 3))"  # "a"를 세트하고 "t2"를 계산.
echo $t2

# 널 명령어(null command). 쉘의 "NOP"(no op, 아무 동작도 않함)에 해당합니다.
# 쉘 내장 명령인 true의 동의어라고도 볼 수 있습니다.
# 주의할 점은 :은 bash 내장 명령이기 때문에 종료 상태는 0이라는 것입니다.

: ${username=`whoami`}
# "username"이 명령어나 내장 명령어가 아닌 경우에
# ${username=`whoami`}   에 : 없이 쓰면 에러가 납니다.

: ${HOSTNAME?} ${USER?}
# 필수적인 환경변수중 하나라도 세트가 안 돼 있다면 에러를 출력.

: > data.xxx   # "data.xxx"은 이제 빈 파일입니다.	      

# cat /dev/null >data.xxx 라고 한 것과 동일하지만
# ":"가 내장 명령어이기 때문에 새 프로세스를 포크(fork) 시키지 않습니다.

File=/etc/bashrc

{
read line1
read line2
} < $File

echo "$File 파일의 첫번째 줄:"
echo "$line1"
echo
echo "$File 파일의 두번째 줄:"
echo "$line2"

# 파이프는 자식 프로세스로 돌기 때문에 스크립트의 변수값을 바꿀 수가 없습니다.

variable="initial_value"
echo "new_value" | read variable
echo "variable = $variable"     # variable = initial_value

(cd ./source/directory && tar cf - . ) | (cd ./dest/directory && tar xpvf -)
# 한 디렉토리의 전체 파일 구조를 다른 디렉토리로 옮김
# [Alan Cox <a.cox@swansea.ac.uk> 제공, 약간의 수정]
# 1) cd /source/directory    옮겨질 파일들이 있는 소스 디렉토리
# 2) &&                     "And-list": 'cd' 명령이 성공하면 다음 명령어가 실행됨
# 3) tar cf - .              'c' 옵션은 새 아카이브를 만들라는 명령어
#                            'f'(file) 옵션은 그 뒤에 나오는 '-'에 의해 타켓 파일을 표준 출력으로 지정해 주고,
#                            현재 디렉토리 트리(.)를 대상으로 하게 합니다.
# 4) |                       파이프를 걸고
# 5) ( ... )                 서브쉘
# 6) cd /dest/directory      옮길 디렉토리로 이동
# 7) &&                      위에서 설명했던 "And-list"
# 8) tar xpvf -              아카이브를 풀고('x'), 소유권과 파일 퍼미션을 유지('p')하고
#                            표준출력으로 메세지를 많이(verbose) 찍게 하고('v')
#                            표준입력에서 데이터를 읽어 들임('f' 다음의 '-')
#
#                            'x'는 명령어고, 'p', 'v', 'f'는 옵션입니다. 주의하세요.
# 헥헥~~~~



# 똑같지만 더 우아한 방법:
#   cd source-directory
#   tar cf - . | (cd ../target-directory; tar xzf -)
#
# cp -a /source/directory /dest     도 같은 결과가 나옵니다.

# bunzip2 linux-2.4.3.tar.bz2 | tar xvf -
# --tar 파일을 풀어서  --    | --"tar" 에게 넘김  --
# "tar"에 "bunzip2"를 처리하는 패치가 안 돼 있다면
# 파이프를 써서 두 단계로 나누어 처리를 해 줘야 합니다.
# 여기서는 "bzip"으로 압축된 커널 소스를 푸는 것을 보여줍니다.
