action=$1
file=$2
if [ $1 = "count" ]; then
	awk '{t+=length($0)}END{print t}' ${2}
elif [ $1 = "invert" ]; then
	rev ${2}
else 
	echo wrong
fi


