# 내장(Builtin) 변수

#     Bash 스크립트의 동작에 영향을 미치는 변수
# $BASH

#     Bash 실행 파일의 경로로, 보통은 /bin/bash임
# $BASH_ENV

#     스크립트가 실행될 때 어디에서 bash 시작 파일을 읽을 것인지를 나타내는 환경 변수
# $BASH_VERSINFO[n]

#     원소 갯수가 6개인 배열로, 현재 설치된 Bash 버전에 대한 정보를 담고 있습니다. 다음에 설명할 $BASH_VERSION 과 비슷하지만 좀 더 자세한 정보를 담고 있습니다.

# Bash 버전 정보:

for n in 0 1 2 3 4 5
do
  echo "BASH_VERSINFO[$n] = ${BASH_VERSINFO[$n]}"
done

# BASH_VERSINFO[0] = 2                      # Major version no.
# BASH_VERSINFO[1] = 04                     # Minor version no.
# BASH_VERSINFO[2] = 21                     # Patch level.
# BASH_VERSINFO[3] = 1                      # Build version.
# BASH_VERSINFO[4] = release                # Release status.
# BASH_VERSINFO[5] = i386-redhat-linux-gnu  # Architecture
                                            # ($MACHTYPE 과 동일).

# $BASH_VERSION
# 시스템에 설치된 Bash 버전
echo "BASH_VERSION = ${BASH_VERSINFO}"

# bash$ echo $BASH_VERSION
# 2.04.12(1)-release

# tcsh% echo $BASH_VERSION
# BASH_VERSION: Undefined variable.
# 어떤 쉘로 동작중인지 알아보려고 할 때 $BASH_VERSION 을 확인해 보는 것은 아주 좋은 방법입니다. 왜냐하면, $SHELL 로는 충분한 정보를 얻을 수 없기 때문입니다.

# $DIRSTACK
# 디렉토리 스택의 내용(pushd와 popd의 영향을 받음)
# 이 내장 변수는 dirs 명령어와 짝을 이룹니다.
echo "DIRSTACK = ${DIRSTACK}"

# $EDITOR
# 스크립트가 부르는 에디터로서, 보통은 vi나 emacs입니다.
echo "EDITOR = ${EDITOR}"

# $EUID
# "유효" 사용자 아이디 값
# su에 의해 쓰일 현재 사용자의 유효 아이디 값.
# $EUID 는 $UID 와 반드시 같지는 않습니다.
echo "EUID = ${EUID}"

# $FUNCNAME
# 현재 함수의 이름
xyz23 ()
{
echo "$FUNCNAME now executing."  # xyz23 now executing.
}

xyz23

echo "FUNCNAME = $FUNCNAME"        # FUNCNAME =  함수 밖에서는 널 값을 갖습니다.

# $GLOBIGNORE
# globbing 시 포함되지 않을 파일명 패턴들의 목록.
echo "GLOBIGNORE = $GLOBIGNORE"

# $GROUPS
# 현재 사용자가 속해 있는 그룹
# /etc/passwd에 적혀 있는 현재 사용자의 그룹 아이디 값을 보여줍니다.
echo "GROUPS = $GROUPS"

# $HOME
# 사용자의 홈 디렉토리로, 보통은 /home/username (예 9-10 참고)
echo "HOME = $HOME"

# $HOSTNAME
# hostname 명령어는 부팅시 init 스크립트에서 시스템 이름을 설정해 줍니다. 하지만 gethostname() 함수로 bash 내부 변수인 $HOSTNAME을 설정해 줄 수도 있습니다. 예 9-10을 참고하세요.
echo "HOSTNAME = $HOSTNAME"

# $HOSTTYPE
# host type
echo "HOSTTYPE = $HOSTTYPE"

# $MACHTYPE과 마찬가지로 시스템 하드웨어를 알려줍니다.
# bash$ echo $HOSTTYPE
# i686

# $IFS
# 입력 필드 구분자
# 디폴트는 공백문자(빈칸, 탭, 뉴라인)지만 콤마로 구분된 데이타 파일을 파싱하려는 경우처럼 변경이 가능합니다. $*는 $IFS의 첫번째 문자를 사용하는 것에 주의하세요. 예 6-1 참고.

# bash$ echo $IFS | cat -vte
# $

# bash$ bash -c 'set w x y z; IFS=":-;"; echo "$*"'
# w:x:y:z

echo "IFS = $IFS"

# $IGNOREEOF
# EOF 무시: 로그 아웃하기 전에 몇 개의 end-of-files (control-D)를 무시할 것인지.
echo "IGNOREEOF = $IGNOREEOF"

# $LC_COLLATE
# 주로 .bashrc 나 /etc/profile 에서 세트되는 이 변수는 파일명 확장이나 패턴 매칭시의 대조(collation) 순서를 제어합니다. 이 값이 잘못 처리되면 파일명 globbing시 원치 않는 결과를 가져 올 수 있습니다.
# 참고: Bash 2.05 이후로, 파일명 globbing 은 대괄호에 들어 있는 문자 범위에 나타나는 대소문자를 더 이상 구분하지 않습니다.
# 예를 들어, ls [A-M]* 은 File2.txt와 file1.txt 모두와 일치될 것입니다.
# 자신만의 대괄호 매칭 동작을 원래대로 바꾸려면 /etc/profile이나 ~/.bashrc등에 export LC_COLLATE=C 라고 해서 LC_COLLATE을 C로 세트해 주면 됩니다.
echo "LC_COLLATE = $LC_COLLATE"

# $LC_CTYPE
# 이 내부 변수는 globbing 과 패터 매칭의 문자 해석을 제어합니다.
echo "LC_CTYPE = $LC_CTYPE"

# $LINENO
# 쉘 스크립트에서 이 변수가 들어 있는 줄의 줄번호를 나타내는데, 스크립트에서 쓰일 때만 의미가 있고, 주로 디버깅에 쓰입니다.
echo "LINENO = $LINENO"

last_cmd_arg=$_  # 저장.
echo "$LINENO 번째 줄, 변수 \"v1\" = $v1"
echo "처리된 마지막 명령어 인자 = $last_cmd_arg"

# $MACHTYPE
# 머신 종류
# 시스템 하드웨어를 구분해 줍니다.
echo "MACHTYPE = $MACHTYPE"

# bash$ echo $MACHTYPE
# i686-debian-linux-gnu

# $OLDPWD
# 바로 전 작업 디렉토리 ("OLD-print-working-directory")
echo "OLDPWD = $OLDPWD"

# $OSTYPE
# 운영 체제 종류
echo "OSTYPE = $OSTYPE"

# bash$ echo $OSTYPE
# linux-gnu

# $PATH
# 실행 파일의 경로, 보통은 /usr/bin/, /usr/X11R6/bin/, /usr/local/bin, 등등.
# 명령어가 주어지면 쉘은 실행 파일들을 위한 경로에 들어있는 디렉토리들에 대해서 자동으로 해쉬 테이블 탐색을 수행합니다.
# 경로에는 환경 변수인 $PATH에 디렉토리들이 콜론으로 구분되어 들어 있습니다. 보통 $PATH 정의는 /etc/profile이나 ~/.bashrc에 들어 있습니다(27장 참고).

# bash$ echo $PATH
# /bin:/usr/bin:/usr/local/bin:/usr/X11R6/bin:/sbin:/usr/sbin
echo "PATH = $PATH"

# PATH=${PATH}:/opt/bin 라고 하면 /opt/bin을 현재 경로에 추가 시킵니다. 이렇게 하면 경로에 임시로 디렉토리를 적절하게 추가할 수 있습니다.
# 스크립트가 끝나면 원래 $PATH 로 복구됩니다(스크립트같은 자식 프로세스는 부모 프로세스인 쉘의 환경 변수를 바꿀 수 없습니다).
# 참고: 보통은 현재 "작업 디렉토리"를 나타내는 ./은 보안상의 이유로 $PATH에서 제외시킵니다.

# $PIPESTATUS
# 마지막으로 실행된 파이프의 종료 상태. 아주 재미있는 것은, 이 결과와 마지막으로 실행된 명령어의 종료 상태가 똑같지는 않다는 것입니다.
# bash$ echo $PIPESTATUS
# 0
echo "PIPESTATUS = $PIPESTATUS"

# bash$ ls -al | bogus_command
# bash: bogus_command: command not found
# bash$ echo $PIPESTATUS
# 141

# bash$ ls -al | bogus_command
# bash: bogus_command: command not found
# bash$ echo $?
# 127

# $PPID
# 어떤 프로세스의 부모 프로세스의 프로세스 아이디(pid)를 $PPID이라고 합니다. [1]
# 이것들을 pidof 명령어와 비교해 보세요.
echo "PPID = $PPID"

# $PS1
# 명령어줄에서 볼 수 있는 메인 프롬프트.
echo "PS1 = $PS1"

# $PS2
# 2차 프롬프트로, 추가적인 입력이 필요할 때 ">" 로 표시됩니다.
echo "PS2 = $PS2"

# $PS3
# 3차 프롬프트로 select 루프문에서 표시됩니다(예 10-27 참고).
# echo "PS3 = $PS3"

# $PS4
# 4차 프롬프트로, 스크립트에 -x 옵션이 걸려서 실행될 때 스크립트의 매 줄마다 "+"로 표시됩니다.
echo "PS4 = $PS4"

# $PWD
# 작업 디렉토리(현재 있는 디렉토리)
# 내장 명령인 pwd와 비슷합니다.
echo "PWD = $PWD"

# $SHELLOPTS
# 현재 켜 있는 쉘 옵션들의 목록으로서 읽기 전용 변수
echo "SHELLOPTS = $SHELLOPTS"

# $SHLVL
# 쉘 레벨로 Bash 가 얼마나 깊이 중첩되어 있는지를 나타냄. 만약에 명령어줄에서 $SHLVL 이 1 이었다면 스크립트에서는 2 가 됩니다.
echo "SHLVL = $SHLVL"

# 참고: $ENV, $LOGNAME, $MAIL, $TERM, $USER, $USERNAME은 bash 내장 명령이 아닙니다.
# 하지만 종종 bash 시스템 구동 파일에서 환경 변수로 설정이 됩니다.
# 사용자의 로긴 쉘을 나타내는 $SHELL은 /etc/passwd를 참고해 설정되거나 "init" 스크립트에서 설정되고, 역시 bash 내장명령어가 아닙니다.
echo "LOGNAME = $LOGNAME"
echo "SHELL = $SHELL"
echo "TERM = $TERM"

# tcsh% echo $LOGNAME
# bozo
# tcsh% echo $SHELL
# /bin/tcsh
# tcsh% echo $TERM
# rxvt

# bash$ echo $LOGNAME
# bozo
# bash$ echo $SHELL
# /bin/bash
# bash$ echo $TERM
# rxvt

# 위치 매개변수(Positional Parameters)
# $0, $1, $2, etc.
# 위치 매개변수로서, 명령어줄에서 스크립트로 넘겨지거나 함수로 넘겨지거나 set 명령어로 강제로 설정됨(예 5-5 과 예 11-10 참고).

# $#
# 명령어줄 인자 [2] 의 갯수나 위치 매개변수들(예 34-2 참고)

# $*
# 한 낱말로 표시되는 위치 매개변수들 모두

# $@
# $*과 똑같지만 각 매개변수는 쿼우트된 문자열로 취급됩니다. 즉, 해석되거나 확장없이 있는 그대로 넘겨집니다.
# 그 결과로 각 인자는 각각이 서로 다른 낱말로 구분돼서 표시됩니다.
# 특수 매개변수인 $@에는 쉘 스크립트로 들어오는 입력을 필터링하는 툴로서 쓰입니다.
# cat "$@"은 자신의 매개변수를 표준입력이나 파일에서 받아 들일 수 있습니다. 예 12-17을 참고하세요.

#다른 특수 매개변수

#$-
#스크립트로 넘겨진 플래그들
#경고
#원래 ksh에서 쓰던 것을 bash에서 채택한 것인데 불행히도 잘 동작하지 않는 것 같습니다. 스크립트 자신이 대화형인지 아닌지 스스로 확인하려고 하는 경우에나 쓸만합니다.
echo "\$- = $-"

#$!
#백그라운드로 돌고 있는 가장 최근 작업의 PID (process id)
echo "\$! = $!"

#$_
#바로 이전에 실행된 명령어의 제일 마지막 인자로 설정되는 특수 변수.
echo "\$_ = $_"

#$?
#명령어나 함수, 스크립트 자신의 종료 상태(예 23-3 참고).
echo "\$? = $?"

#$$
#스크립트 자신의 프로세스 아이디로 보통 임시 파일 이름을 만들 때 사용합니다(예 A-8와 예 30-5, 예 12-23 참고).
echo "\$\$ = $$"
