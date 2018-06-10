#!/bin/bash
# escaped.sh: 이스케이프된 문자들

echo; echo

echo "\v\v\v\v"      # \v\v\v\v 라고 출력
# 'echo'가 이스케이프된 문자들을 출력하게 하려면 -e 옵션을 써야 됩니다.
echo -e "\v\v\v\v"   # 4 개의 수직탭 출력
echo -e "\042"       # " 출력(따옴표, 8진수 아스키 문자 42).


# Bash 버전 2 이후에서는 $'\xxx' 도 허용됩니다.
echo $'\n'
echo $'\a'
echo $'\t \042 \t'   # 탭으로 둘려쌓인 따옴표(").

# 변수에 아스키 문자를 할당하기.
# ------------------------------
quote=$'\042'        # " 를 변수로 할당.
echo "$quote 여기는 쿼우트된 부분이고, $quote 여기는 안 된 부분입니다."

echo

# 변수에 아스키 문자를 여러개 쓰기.
triple_underline=$'\137\137\137'  # 137 은 "_"의 8진수 아스키 코드.
echo "$triple_underline 밑줄 $triple_underline"

ABC=$'\101\102\103\010'           # 101, 102, 103 은 각각 8진수 A, B, C.
echo $ABC

echo; echo

escape=$'\033'                    # 033 은 이스케이프의 8진수.
echo "\"escape\" echoes as $escape"

echo; echo

echo \z               #  z
echo \\z              # \z
echo '\z'             # \z
echo '\\z'            # \\z
echo "\z"             # \z
echo "\\z"            # \z
echo `echo \z`        #  z
echo `echo \\z`       #  z
echo `echo \\\z`      # \z
echo `echo \\\\z`     # \z
echo `echo \\\\\\z`   # \z
echo `echo \\\\\\\z`  # \\z
echo `echo "\z"`      # \z
echo `echo "\\z"`     # \z

# cat <<EOF
# \z
# EOF                   # \z

# cat <<EOF
# \\z
# EOF                   # \z

# Stephane Chazelas 제공.

# 명령어의 인자 리스트 중간에 나오는 빈칸을 이스케이프 시키면 낱말 조각남을 막을 수 있습니다.
file_list="/bin/cat /bin/gzip /bin/more /usr/bin/less /usr/bin/emacs-20.7"
# 명령어에 넘길 인자(들)의 파일 리스트.

# 리스트에 두 개를 더 추가하고 리스트를 보여줌.
ls -l /usr/X11R6/bin/xsetroot /sbin/dump $file_list

echo "-------------------------------------------------------------------------"

# 빈칸을 이스케이프 시키면 어떤 일이 일어날까요?
ls -l /usr/X11R6/bin/xsetroot\ /sbin/dump\ $file_list
# 에러: 파일들을 구분 지어줄 빈칸을 이스케이프 시켰기 때문에
#       제일 앞 세개의 파일이 'ls -l' 에게 하나의 인자로 넘어갑니다.

# 이스케이프는 한 명령어를 여러줄에 걸쳐 쓸 수 있게도 해 줍니다.
# 보통은, 줄이 다르면 다른 명령어를 나타내지만 줄 끝에 이스케이프를
# 걸면 뉴라인 문자를 이스케이프시키기 때문에 그 다음줄이 원래 줄과
# 한 줄로 이어지게 됩니다.

(cd ./source/directory && tar cf - . ) | \
(cd ./dest/directory && tar xpvf -)
# 다시 보는 알란 콕스의 디렉토리 트리 복사 명령어
# 여기서는 더 읽기 쉽도록 두 줄로 나누었습니다.

# 이렇게도 가능하죠:
tar cf - -C ./source/directory . |
tar xpvf - -C ./dest/directory
# 밑의 참고를 보세요.
# (Thanks, Stephane Chazelas.)

# 참고: 줄이 파이프 문자인 |으로 끝난다면 굳이 이스케이프 문자(\)를 적어줄 필요가 없습니다.
# 하지만, 여러줄에 걸친 하나의 명령어에서 줄 끝에 항상 이스케이프 문자를 적어주는 것은 아주 좋은 프로그래밍 습관입니다.

echo "foo
bar" 
#foo
#bar

echo

echo 'foo
bar'    # 아직은 다른점이 없죠.
#foo
#bar

echo

echo foo\
bar     # 뉴라인이 이스케이프 됐습니다.
#foobar

echo

echo "foo\
bar"     # 약한 쿼우트 안에서는 \ 가 이스케이프 문자로 해석되기 때문에 똑같습니다.
#foobar

echo

echo 'foo\
bar'     # 강한 쿼우팅 안에서 \ 는 아무 의미 없이 그냥 \ 입니다.
#foor\
#bar

# Stephane Chazelas 제공.

exit 0
