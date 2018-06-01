# clean up
# execute with root

cd /var/log
cat /dev/null > messages
cat /dev/null > wtmp
echo "로그를 정리했습니다."
