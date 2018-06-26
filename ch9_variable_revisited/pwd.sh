#!/bin/bash

E_WRONG_DIRECTORY=73

clear # 화면 정리.

TargetDirectory=/home/bozo/projects/GreatAmericanNovel

cd $TargetDirectory
echo "$TargetDirectory 디렉토리의 오래된 파일을 지웁니다."

if [ "$PWD" != "$TargetDirectory" ]
then    # 실수로 다른 디렉토리를 지우지 않게 합니다.
  echo "지울 디렉토리가 아닙니다!"
  echo "$TargetDirectory 디렉토리가 아니라 $PWD 디렉토리입니다,"
  echo "취소합니다!"
  exit $E_WRONG_DIRECTORY
fi  

rm -rf *
rm .[A-Za-z0-9]*    # 도트 파일 삭제.
# 이름이 여러개의 점으로 시작하는 파일도 지우려면 이렇게 하세요.   rm -f .[^.]* ..?*   
# (shopt -s dotglob; rm -f *)   라고 해도 됩니다.
# 지적해 줘서 고마워요. S.C.

# 파일이름에는 "/"를 제외하고 0 - 255 사이의 모든 문자가 들어갈 수 있습니다.
# 이상한 문자로 시작하는 파일을 지우는 것은 연습문제로 남겨 놓습니다.

# 필요하다면 다른 작업을 하세요.

echo
echo "끝."
echo "$TargetDirectory 디렉토리의 오래된 파일을 모두 삭제했습니다."
echo


exit 0
