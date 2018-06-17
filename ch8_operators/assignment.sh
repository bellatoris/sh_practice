var=27
category=minerals  # "=" 다음에 빈 칸이 들어가면 안 됩니다.

# 경고

# "=" 할당 연산자와 = 테스트 연산자를 헷갈리면 안 됩니다.

#    테스트 연산자인 =

if [ "$string1" = "$string2" ]
# if [ "Xstring1" = "Xstring2" ] 라고 해야 변수 값이 비어 있을 경우에
# 발생할지도 모를 에러를 막아주기 때문에 더 안전합니다.
# "X"는 상쇄되어 없어집니다.
then
   command
fi
