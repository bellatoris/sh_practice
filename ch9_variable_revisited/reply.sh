# $REPLY

# read에 변수가 안 주어졌을 때 저장되는 기본값이고, select 메뉴에서는 변수의 값이 아니라 선택한 숫자가 저장됩니다.

#!/bin/bash

echo
echo -n "제일 좋아하는 야채가 뭐에요? "
read

echo "제일 좋아하는 야채가 $REPLY 군요."
# REPLY 는 가장 최근의 "read"가 변수 없이 주어졌을 때 그 값을 담고 있습니다.

echo
echo -n "제일 좋아하는 과일은요? "
read fruit
echo "당신이 제일 좋아하는 과일은 $fruit 지만,"
echo "\$REPLY 의 값은 여전히 $REPLY 네요."
# $fruit 변수가 "read"의 값을 가져가 버렸기 때문에 $REPLY 는 여전히
# 앞에서 설정된 값을 갖고 있습니다.

echo

exit 0
