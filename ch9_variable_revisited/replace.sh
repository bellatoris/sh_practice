# 변수 확장/문자열조각 대치

# 여기서 소개하는 것들은 ksh에서 따 온 것입니다.
# ${var:pos}

# var 변수가 pos 옵셋부터 시작하도록 확장.
# ${var:pos:len}

# 변수 var가 pos에서 최대 len만큼의 길이를 갖도록 확장. 이 연산자의 창조적인 사용 예제를 보려면 예 A-9 참고. 
# ${var/patt/replacement}
# var에 첫번째로 일치하는 patt을 replacement로 대치시킴.
# replacement를 안 적으면 patt이 지워짐.

# ${var//patt/replacement}
# 전역 대치(Global replacement). var에서 일치하는 모든 patt을 replacement로 대치시킴.
# 위의 경우와 비슷하게 replacement를 안 적어주면 모든 patt이 지워짐.

# 예 9-14. 임의의 문자열을 파싱하기 위해 패턴 매칭 사용하기

#!/bin/bash

var1=abcd-1234-defg
echo "var1 = $var1"

t=${var1#*-*}
echo "var1 (첫번째 - 를 포함한 부분까지 잘라냄) = $t"
#  # 이 가장 짧은 문자열과 매치하고 * 가 빈 문자열을 포함한 모든것과 
#+ 일치하기 때문에 t=${var1#*-}  도 똑같이 동작합니다.
# (S. C. 가 지적해 주었습니다.)

t=${var1##*-*}
echo "var1에 \"-\" 이 들어있다면 빈 문자열을 리턴함...    var1 = $t"


t=${var1%*-*}
echo "var1 (제일 마지막의 - 부터 끝까지 잘라냄) = $t"

echo

# -------------------------------------------
path_name=/home/bozo/ideas/thoughts.for.today
# -------------------------------------------
echo "path_name = $path_name"
t=${path_name##/*/}
echo "접두어가 잘려진 path_name = $t"
echo ${path_name%/}
# 이 경우에서는    t=`basename $path_name` 이라고 해도 똑같습니다.
#  t=${path_name%/}; t=${t##*/}   라고 하는 것이 좀 더 일반적인 해법이지만,
#+ 가끔은 실패할 수도 있습니다.
#  $path_name 이 뉴라인으로 끝날 경우에는 `basename $path_name` 은 제대로 동작하지 않겠지만,
#+ 위 표현식은 제대로 동작할 것입니다.
# (Thanks, S.C.)

t=${path_name%/*.*}
# t=`dirname $path_name`    라고 하는 것과 똑같습니다.
echo "접미어가 잘려진 path_name = $t"
# 이렇게 하면 "../", "/foo////", # "foo/", "/" 같은 경우에는 실패할 것입니다.
#  basename 은 접미어가 없고 dirname 은 있을 경우에 접미어를 삭제하는 것
#+ 역시 복잡한 문제입니다.
# (Thanks, S.C.)

echo

t=${path_name:11}
echo "첫번째 11개 문자가 잘려나간 $path_name = $t"
t=${path_name:11:5}
echo "첫번째 11개 문자가 잘려나가고 길이가 5인 $path_name = $t"

echo

t=${path_name/bozo/clown}
echo "\"bozo\" 가 \"clown\" 으로 대치된 $path_name = $t"
t=${path_name/today/}
echo "\"today\" 가 삭제된 $path_name = $t"
t=${path_name//o/O}
echo "모든 소문자 o 를 대문자로 만든 $path_name = $t"
t=${path_name//o/}
echo "모든 소문자 o 를 삭제한 $path_name = $t"

exit 0
