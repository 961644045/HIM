#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
���0_test.sh ���kA���W<o�;YIc����E=y�fvf4Cvw����@N� 
E�P�P�P(�7�h���6����_�mL����>߷�y�m�J"���êg=���9l�ڠ�����>岺�Eh�&�`GЀ���ٯ�d�%��$�����~�5 gC�
���N?M�^]�>�����Ӛ�φ��[ӭ��{5��k�����8ywPSDBj��L����kI,}�ՓG��:Rwz���'"A�'��&'�(�)�M15T�D��B��e�([+�u/�҂('�9FB1$�ϰb���/0E���v܂����i?����1��]�����l�WU���͗˰9���rlND�Y��w�U��R@r/��Ls�/��WR�L�,�Q��Ǎ鈴f�ah��v��V{=X�l�!�
:���������|��ُof�fo84�ȨF7����rE\�JE84�Zj��Ig��9]Ʈ����N�u!�\c�lZ!R~꿍����  