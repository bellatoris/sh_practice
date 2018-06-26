# $UID
# 사용자 아이디 값
# /etc/passwd에 저장되어 있는 현재 사용자의 사용자 식별 숫자
# 비록 su에 의해서 임시로 다른 사용자로 인식되더라도 현재 사용자의 실제 아이디를 나타냅니다.
# $UID는 읽기만 되는 변수로 명령어 줄이나 스크립트에서 변경할 수 없습니다. 그리고, id 내장 명령과 짝을 이룹니다.
# 예 9-4. 내가 루트인가?

#!/bin/bash
# am-i-root.sh:   내가 루트야 아니야?

ROOT_UID=0   # 루트 $UID는 0.

if [ "$UID" -eq "$ROOT_UID" ]  # Will the real "root" please stand up?
then
  echo "루트네요."
else
  echo "그냥 보통 사용자에요.(그래도 당신 어머니는 있는 그대로의 당신을 사랑하신답니다)."
fi


# ============================================================= #
# 스크립트가 이미 종료됐기 때문에 밑의 코드는 실행되지 않습니다.

# 루트인지 알아내는 다른 방법:

ROOTUSER_NAME=root

username=`id -nu`
if [ "$username" = "$ROOTUSER_NAME" ]
then
  echo "루티 투트 투트(Rooty, toot, toot), 당신은 루트 사용자군요."
else
  echo "그냥 보통 사람이군요."
fi

exit 0
