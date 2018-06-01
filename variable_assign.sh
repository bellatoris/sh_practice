#!/bin/bash

echo

# When is a variable "naked", i.e., lacking the '$' in front?
# When it is being assigned, rather than referenced.

# 할당할 때
a=879
echo "\"a\" 의 값은 $a 입니다."

# 'let'으로 할당할 때
let a=16+5
echo "\"a\" 의 값은 이제 $a 입니다."

echo

# 'for' 루프에서(실제로는, 일종의 속임수 할당)
echo -n "루프에서 \"a\" 의 값은 "
for a in 7 8 9 11
do
  echo -n "$a 입니다."
done

echo
echo $a

echo
echo

# 'read' 문에서(역시 일종의 할당임)
echo -n "\"a\" 를 넣으세요."
read a
echo "\"a\" 의 값은 이제 $a 입니다."

echo
#!/bin/bash

a=23              # 평범한 경우
echo $a
b=$a
echo $b

# 이제 약간 재밌게 해 봅니다...

a=`echo Hello!`   # 'echo' 명령어의 결과를 'a' 로 할당
echo $a

a=`ls -l`         # 'ls -l' 명령어의 결과를 'a' 로 할당
echo $a

echo

# $(...) 기법을 써서 변수 할당하기(역따옴표(backquotes)보다 새로운 방법)

# /etc/rc.d/rc.local 에서 발췌
R=$(cat /etc/zshrc)
arch=$(uname -m)

echo $R
echo 
echo $arch
