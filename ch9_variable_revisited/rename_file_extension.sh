# (renaming file extensions).
#
#         rfe 원래확장자 새확장자
#
# 예제:
# 현재 디렉토리의 *.gif 를 *.jpg 로 바꾸려면,
#          rfe gif jpg

ARGS=2
E_BADARGS=65

if [ $# -ne $ARGS ]
then
  echo "사용법: `basename $0` 원래확장자 새확장자"
  exit $E_BADARGS
fi

for filename in *.$1
  # 첫번째 인자로 끝나는 파일 목록을 전부 탐색.
do
  mv $filename ${filename%$1}$2
  # 첫번째 인자와 일치하는 부분을 떼어내고,
  # 두번째 인자를 덧붙임.
done

exit 0
