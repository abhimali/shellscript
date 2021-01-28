threshold=5
source="./Source/"
archive="./Archive/"
for filename in $(ls $source); do
	size=$(du --apparent-size $source$filename | awk '{ print $1 }')
	if [ $size -ge $threshold ]
	then
		tar -cvf $archive$filename.tgz $source$filename 
		echo "greater, so compressing : " $filename
	else
		echo "smaller, so ignoring : " $filename
	fi
done;