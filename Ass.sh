threshold=5
source="./Source/"
archive="./Archive/"
for filename in $(ls $source); do
	echo filename $filename
	size=$(du --apparent-size $source$filename | awk '{ print $1 }')
	echo size $size 
	if [ $size -ge $threshold ]
	then
		tar -cvf $archive$filename.tgz $source$filename 
		echo "greater" $filename
	else
		echo "smaller" $filename
	fi
done;