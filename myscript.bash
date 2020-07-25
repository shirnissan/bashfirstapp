action=$1
file=$2

if [ -f "$file" ]; then
	count="$(wc -m < $file)"
else
	file="$(curl -s $file)"
	count="$(echo ${#file})"
fi
c
count="$(($count-1))"

if [ $count -gt 0 ]; then
	if [ $action = "count" ]; then
		echo $count
	elif [ $action = "invert" ]; then
		if [ -f "$file" ]; then
			rev "$file"
		else
			echo "$file" | rev 
		fi
	else 
		echo 'Please add the right parameters'
	fi
else
	echo 'this file is empty'
fi
