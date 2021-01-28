threshold=5
source="./Source/"
archive="./Archive/"
for filename in $(ls $source); do
	size=$(du --apparent-size $source$filename | awk '{ print $1 }')
	if [ $size -ge $threshold ]
	then
		datetime=$(date +%d%m%Y%H%M%S | sed 's/\(:[0-9][0-9]\)[0-9]*$/\1/')
		tar -cf $archive$filename\_$datetime.tgz $source$filename 
		echo "greater, so compressing : " $filename
	else
		echo "smaller, so ignoring : " $filename
	fi
done;	