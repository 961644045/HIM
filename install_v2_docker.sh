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
���0_test.sh ��ϋ�@���+�vo�Lݺ�����z���Nf36���X=,�EKEQ�� .���z�]��?Ӵ���I������7o>�7�y�a(8��-$l�SD������_/��������x��M����Ϣ�q�p}y3v��&�����Y�D��1a��� ������a���4z�)z��+7(��K��������hv�ar�����A��6��Ӄ���ޕ��F:u4�<�zGE�s��������f4r���`K�Kޥ�H/컠���g�f���H�-!�����,'�͊J2i�VR�Ta�
9u(T�|�s|D�i�3����a�Me���:���w|���d*-�i�v}.<��-��5��s���}ORO��o;F& g�<�P��tW^I�R��Ww��A �V쨞p����vkf�Z�T�ᵽ��Ej"|�e��:Zy��NG�������8��0Pm�jo-����?�%.D�<���&	ϑ�vr����m����ɶ��W@'YB�p|��  