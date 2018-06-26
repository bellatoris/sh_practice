#!/bin/bash
# timeout.sh

# Stephane Chazelas 작성.
# 이 문서의 저자가 수정.

INTERVAL=5                # 타임아웃 인터벌

timedout_read() {
  timeout=$1
  varname=$2
  old_tty_settings=`stty -g`
  stty -icanon min 0 time ${timeout}0
  eval read $varname      # 아니면 그냥     read $varname
  stty "$old_tty_settings"
  # "stty" 맨 페이지 참조.
}

echo; echo -n "이름이 뭐죠? 빨리 대답해요! "
timedout_read $INTERVAL your_name

# 모든 터미널 타입에서 동작하지 않을 수도 있습니다.
# 최대 타임아웃은 어떤 터미널이냐에 달려있습니다.
# (보통은 25.5 초).

echo

if [ ! -z "$your_name" ]  # 타임아웃 전에 입력이 있다면...
then
  echo "아하, 이름이 $your_name 군요."
else
  echo "타임아웃."
fi

echo

# 이 스크립트는 "timed-input.sh" 스크립트와 약간 다르게 동작하는데,
# 키가 눌릴 때마다 타임아웃 카운터가 리셋됩니다.

exit 0
