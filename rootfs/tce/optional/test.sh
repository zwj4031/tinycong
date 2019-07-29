set -- $(cat /proc/cmdline)
for x in "$@"; do 
case "$x" in
url=*)
export url="${x#url=}"
;;
user=*)
export user="${x#user=}"

;;
esac
done
echo $url
echo $user
