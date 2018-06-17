if [ -f $HOME/.Xclients ]; then
  exec $HOME/.Xclients
elif [ -f /etc/X11/xinit/Xclients ]; then
  exec /etc/X11/xinit/Xclients
else
  # 아마 이 부분은 절대 실행되지 않겠지만 혹시 모르니까.
  # (Xclients 에도 역시 안전 장치가 걸려 있습니다) 전혀 해가 없습니다.
  xclock -geometry 100x100-5+5 &
  xterm -geometry 80x50-50+150 &
  if [ -f /usr/bin/netscape -a -f /usr/share/doc/HTML/index.html ]; then
    netscape /usr/share/doc/HTML/index.html &
  fi
fi
