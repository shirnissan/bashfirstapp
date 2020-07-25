action=$1
file=$2
count="$(wc -m < $file)"
count="$((count-1))"
if [ $count -gt 0 ]; then
	if [ $action = "count" ]; then
		echo $count
	elif [ $action = "invert" ]; then
		rev $file
	else 
		echo 'Please add the right parameters'
	fi
else
	echo 'this file is empty'
fi
