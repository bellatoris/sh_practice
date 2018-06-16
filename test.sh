# (( ... )) 와 let ... 은 자신이 계산한 산술식이 0이 아닌 값을 가질 경우에 종료 상태 0을 리턴합니다.
# 따라서, 이런 산술 확장은 산술 비교를 할 때 쓸 수 있습니다.

# let "1<2" 는 0 을 리턴("1<2" 가 "1" 로 확장되므로)
# (( 0 && 1 )) 은 1 을 리턴("0 && 1" 이 "1" 으로 확장되므로)

# if 는 대괄호로 조건을 묶지 않고도 아무 명령어나 테스트 할 수 있습니다.

if cmp test.sh test.sh > /dev/null  # 결과를 무시.
then echo "파일 a 와 b 는 같습니다."
else echo "파일 a 와 b 는 다릅니다."
fi

if grep -q Bash test.sh
then echo "file에는 Bash가 적어도 한 번 이상 나옵니다."
fi

if ls > /dev/null
then echo "성공."
else echo "실패."
fi

# if/then 은 중첩된 비교나 테스트가 가능합니다.

if echo "다음에 나오는 *if* 는 첫번째 *if* 의 비교 대상에 포함됩니다."
  if [[ $comparison = "integer" ]]
    then (( a < b ))
  else
    [[ $a < $b ]]
  fi
then
  echo '$a 는 $b 보다 작습니다.'
else
  echo '$a 는 $b 보다 작지 않습니다.'
fi


echo

echo "\"0\" 테스트"
if [ 0 ]      # zero
then
  echo "0 은 참."
else
  echo "0 은 거짓."
fi

echo

echo "\"NULL\" 테스트"
if [ ]        # NULL (empty condition)
then
  echo "NULL 은 참."
else
  echo "NULL 은 거짓."
fi

echo

echo "\"xyz\" 테스트"
if [ xyz ]    # 문자열
then
  echo "임의의 문자열은 참."
else
  echo "임의의 문자열은 거짓."
fi

echo

echo "\"\$xyz\" 테스트"
if [ $xyz ]   # $xyz 가 널인지 테스트...
              # 하지만 단지 초기화되지 않은 변수일 때만.
then
  echo "초기화 안 된 변수는 참."
else
  echo "초기화 안 된 변수는 거짓."
fi

echo

echo "\"-n \$xyz\" 테스트"
if [ -n "$xyz" ]            # 좀 더 어렵게 보이게.
then
  echo "초기화 안 된 변수는 참."
else
  echo "초기화 안 된 변수는 거짓."
fi

echo

xyz=                        # 널 값으로 초기화.

echo "\"-n \$xyz\" 테스트"
if [ -n "$xyz" ]
then
  echo "널 변수는 참."
else
  echo "널 변수는 거짓."
fi


echo


# "false"가 참일 때.

echo "\"false\" 테스트"
if [ "false" ]              #  "false"는 그냥 문자열 같죠?
then
  echo "\"false\" 는 참."   #+ 그래서 참이 되네요.
else
  echo "\"false\" 는 거짓."
fi

echo

echo "\"\$false\" 테스트"  # 초기화 안 된 변수, 다시.
if [ "$false" ]
then
  echo "\"\$false\" 는 참."
else
  echo "\"\$false\" 는 거짓."
fi                          # 흠, 이게 우리가 원하던 거죠.


echo

if test -z "$1"
then
  echo "명령어줄 인자가 없습니다."
else
  echo "첫번째 명령어줄 인자는 $1 입니다."
fi


if [ -z "$1" ]    # 위의 코드 블럭과 기능적으로 동일합니다.
#   if [ -z "$1"   라고 해도 동작하겠지만...
#+  Bash 는 오른쪽 대괄호가 빠졌다고 에러 메세지를 냅니다.
then
  echo "명령어줄 인자가 없습니다."
else
  echo "첫번째 명령어줄 인자는 $1 입니다."
fi

echo

# 참고: [[ 과 ]] 사이에서는 파일명 확장이나 낱말 조각남이 일어나지 않지만 매개변수 확장이나 명령어 치환은 일어납니다.

file=/etc/passwd

if [[ -e $file ]]
then
  echo "비밀번호 파일이 존재합니다."
fi

if [ -e $file ]
then
  echo "비밀번호 파일이 존재합니다."
else
  echo "안 존재해"
fi

# 작은 정보: [ ... ] 말고 [[ ... ]] 를 쓰면 많은 논리적 에러들을 막을 수 있습니다.
# 예를 들어 &&, ||, <, > 연산자들은 [ ] 에서 에러를 내지만 [[ ]] 에서는 잘 동작합니다.

# 참고: if다음에 꼭 test나 테스트 대괄호( [ ]나 [[ ]] )가 나오지 않아도 됩니다.

dir=/home/bozo
if cd "$dir" 2>/dev/null; then   # "2>/dev/null" 는 에러 메세지를 숨겨줍니다.
echo "현재 디렉토리는 $dir 입니다."
else
echo "$dir 로 옮겨갈 수 없습니다."
fi

# "if COMMAND" 문은 COMMAND의 종료 상태를 리턴합니다.

# 비슷하게, 테스트 대괄호가 리스트와 같이 쓰이면 if 없이 단독으로 쓰일 수도 있습니다.

var1=20
var2=22
[ "$var1" -ne "$var2" ] && echo "$var1 는 $var2 와 같지 않습니다."

home=/home/bozo
[ -d "$home" ] || echo "$home 디렉토리는 존재하지 않는 디렉토리입니다."

# (( )) 문은 산술식을 평가해서 확장해 줍니다. 그 산술식이 0 으로 평가되면 종료 상태 1이나
# "false"를 리턴하고 0 이 아닌 값으로 평가되면 종료 상태 0이나 "true"를 리턴합니다.
# 앞에서 얘기했던 test나 [ ]와 현격한 차이를 보여줍니다.

# 예 7-3. (( ))로 산술식 테스트 하기
# 산술 테스트.
# (( ... )) 는 산술문을 평가하고 테스트 해 줍니다.
# 종료 상태는 [ ... ] 와 반대입니다!

(( 0 ))
echo "\"(( 0 ))\" 의 종료 상태는 $?."   # 1

(( 1 ))
echo "\"(( 1 ))\" 의 종료 상태는 $?."   # 0

(( 5 > 4 ))                             # 참
echo $?                                 # 0

(( 5 > 9 ))                             # 거짓
echo $?                                 # 1

a=3
[[ $a == z* ]]    # $a 가 "z"로 시작하면 참(패턴 매칭)
[[ $a == "z*" ]]  # $a 가 z* 와 같다면 참

[ $a == z* ]      # 파일 globbing이나 낱말 조각남이 일어남
[ "$a" == "z*" ]  # $a 가 z* 와 같다면 참

# Thanks, S.C.

exit 0
