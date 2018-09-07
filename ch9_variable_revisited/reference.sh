# 어떤 변수값이 다음에 나올 변수의 이름이라고 가정해 봅시다. 그렇다면 그 어떤 변수로 다음에 나올 변수의 값을 알아낼 수 있을까요?
# 예를 들어, a=letter_of_alphabet 이고 letter_of_alphabet=z 라고 할 때 a를 참조하면 z가 나올까요?
# 이는 우리 생각처럼 제대로 동작을 하고 이를 간접 참조라고 부릅니다. eval var1=\$$var2 처럼 약간은 이상하게 생긴 형태로 써먹을 수 있습니다.
# 예 9-17. 간접 참조

#!/bin/bash
# 변수 간접 참조.

a=letter_of_alphabet
letter_of_alphabet=z

echo

# 직접 참조.
echo "a = $a"

# 간접 참조.
eval a=\$$a
echo "이제 a = $a"

echo


# 이제 2차 참조(second order reference)를 바꿔보도록 하죠.

t=table_cell_3
table_cell_3=24
echo "\"table_cell_3\" = $table_cell_3"
echo -n "역참조(dereferenced)된 \"t\" = "; eval echo \$$t
# 이 간단한 예제에서는, 
#   eval t=\$$t; echo "\"t\" = $t"
# 라고 해도 됩는데 왜 그럴까요?
t=table_cell_3
table_cell_3=24
eval t=\$$t; echo "\"t\" = $t"

echo

t=table_cell_3
NEW_VAL=387
table_cell_3=$NEW_VAL
echo "\"table_cell_3\" 의 값을 $NEW_VAL 로 바꿉니다."
echo "\"table_cell_3\" 은 이제 $table_cell_3 이고,"
echo -n "역참조된 \"t\" 는 "; eval echo \$$t
# "eval" 은 "echo"와 "\$$t" 두 개의 인자를 받아서 $table_cell_3 과 똑같이 세트해줍니다.
echo

# (S.C. 가 위 동작을 자세히 설명해 주었습니다.)


# "Bash, 버전 2" 장에서 설명할 ${!t} 표기법도 쓸 수 있습니다.
# "ex78.sh" 예제를 참고하세요.

exit 0
