# $TMOUT
# $TMOUT 환경 변수를 0 이 아닌 값 time으로 설정해 놓으면 그 시간이 지난 다음에는 로그아웃이 됩니다.
# 참고: 불행하게도 이 변수는 콘솔상의 쉘 프롬프트나 엑스텀(한텀)에서만 동작합니다.
# 예를 들어, read 문에서 $TMOUT을 같이 쓰고 싶겠지만 실제로는 제대로 동작하지 않습니다.(ksh 버전에서는 read의 타임아웃이 제대로 동작한다고 보고된 바 있습니다).
# 타임 아웃을 쉘 스크립트에서 구현할 수는 있으나 그렇게 효과적이지 않습니다.
# 한가지 가능한 방법은, 타임 아웃이 났을 때 타이밍 루프가 스크립트에게 시그널을 보내도록 세팅해야 하고 타이밍 루프가 발생시킨 (예 30-4 참고) 인터럽트를 처리할 시그널 처리 루틴도 만들어야 합니다, 휴~~.
# 예 9-2. 타임 아웃 처리 입력

#!/bin/bash
# timed-input.sh

# TMOUT=3            스크립트에서는 쓸모가 없습니다.

TIMELIMIT=3  # 여기서는 3초, 다른 값으로 세트할 수 있습니다.

PrintAnswer() {
  if [ "$answer" = TIMEOUT ]; then
    echo $answer
  else     # 두 번의 인스턴스를 구분하기 위해서.
    echo "제일 좋아하는 야채는 $answer 이군요."
  kill $!  # 백그라운드에서 도는 TimerOn 함수가 더 이상 필요없기 때문에 kill 시킴.
           # $! 는 백그라운드에서 돌고 있는 가장 최근 작업의 PID 입니다.
  fi
}

TimerOn() {
  sleep $TIMELIMIT && kill -s 14 $$ &
  # 3초를 기다리고 알람 시그널(sigalarm)을 스크립트에 보냄.
}

Int14Vector() {
  answer="TIMEOUT"
  PrintAnswer
  exit 14
}

trap Int14Vector 14   # 타이머 인터럽트(14)는 우리 의도대로 타임아웃을 처리함.

echo "제일 좋아하는 야채가 뭐죠? "
TimerOn
read answer
PrintAnswer


# 이는 분명히 타임아웃 입력에 대한 미봉책입니다만,
# Bash 로 할 수 있는 최선을 다한 것입니다.
# (독자들에게 도전: 더 나은 해결책을 제시해 보세요.)

# 더 우아한 다른 것이 필요하다면 C 나 C++ 의 'alarm'이나 'setitimer' 같은
# 적당한 라이브러리 함수를 써서 구현하기 바랍니다.

exit 0
